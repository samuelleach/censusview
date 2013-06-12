function click(d) {
  var x, y, k;

  if (d && centered !== d) {
    var centroid = path.centroid(d);
    x = centroid[0];
    y = centroid[1];
    k = 15; // Zoom factor
    centered = d;
  } else {
    x = width / 2;
    y = height / 2;
    k = 1;
    centered = null;
  }

  g.selectAll("path")
      .classed("active", centered && function(d) { return d === centered; });

  g.transition()
      .duration(1000)
      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")scale(" + k + ")translate(" + -x + "," + -y + ")")
      .style("stroke-width", 1.5 / k + "px");
}

function mouseOver(d) {
  data = popDensityById[d.id];
  data_string = data ? '(density = ' + d3.round(data,0) + ' per sq. mile, total = ' + d3.round(data * areaById[d.id])+')' : '';

  sidebarSel
        .html(d.properties.Sprawl + ' ' + d.id + '</br>' + data_string);
}
function mouseOut() {
  sidebarSel
        .text('');
}

function centre_and_bound_projection(geojson_object) {
  projection
      .scale(1)
      .translate([0, 0]);

  var b = path.bounds(geojson_object),
      s = .95 / Math.max((b[1][0] - b[0][0]) / width, (b[1][1] - b[0][1]) / height),
      t = [(width - s * (b[1][0] + b[0][0])) / 2, (height - s * (b[1][1] + b[0][1])) / 2];

  projection
      .scale(s)
      .translate(t);
}

var width = 788,
    height = 600,
    centered;

var color = d3.scale.threshold()
    .domain([100, 500, 1000, 2000, 5000, 10000])
    .range(colorbrewer.YlGnBu[7]);

var projection = d3.geo.albers()
    .center([0, 52.5])
    .rotate([4.4, 0])
    .parallels([50, 60])
    .scale(1200 * 5)
    .translate([width / 2, height / 2]);

var path = d3.geo.path()
    .projection(projection)
    .pointRadius(2);

var sidebarSel = d3.select("#sidebar");

var svg = d3.select("#map").append("svg")
    .attr("width", width)
    .attr("height", height);

var g = svg.append("g");
var layerPostalDistrict = g.append("g");
var layerPostalArea = g.append("g");
var layerUK = g.append("g");

queue()
    .defer(d3.json, "/data/uk.json")
    .defer(d3.json, "/data/PostalArea.topo.json")
    .defer(d3.json, "/data/PostalDistrict_v2.topo.json")
    .defer(d3.json, "/census_counts/" + $('body').data('census_var') + ".json")
    .await(ready);

function ready(error, uk, postalarea, postaldistrict, census) {
  var subunits = topojson.feature(uk, uk.objects.subunits);
  var postalareas = topojson.feature(postalarea, postalarea.objects.PostalArea);
  var postaldistricts = topojson.feature(postaldistrict, postaldistrict.objects.PostalDistrict_v2);

  // Processing of census to get unemployment rate
  // var rateById = {};
  // census.forEach(function(d) { rateById[d.PostArea] = (+d.Tot16to74 -d.TotEmploy) / (+d.Tot16to74); });

  areaById = {};
  // 0.0000003861003 is conversion factor from sqaure metres to square miles
  postaldistricts.features.forEach(function(d) { areaById[d.id] = d.properties.AREA * 0.0000003861003; });

  popDensityById = {};
  census.forEach(function(d) { popDensityById[d.postarea] = +d.count / areaById[d.postarea]; });

  centre_and_bound_projection(postalareas);

  layerUK.append("path")
      .datum(topojson.mesh(uk, uk.objects.subunits))
      .attr("class", "subunit-boundary")
      .attr("d", path);

  layerPostalDistrict.selectAll(".postdistricts")
      .data(postaldistricts.features)
      .enter().append("path")
      .attr("class", "postaldistricts")
      .attr("id", function(d) {return d.id;})
      // .style("fill", function(d) { return myColor = rateById[d.id] ? color(rateById[d.id]) : "#FFFFFF"; })
      .style("fill", function(d) { return myColor = popDensityById[d.id] ? color(popDensityById[d.id]) : "#FFF"; })
      // .style("fill", function(d) { return myColor = color(popDensityById[d.id]); })
      .attr("d", path)
      .on("click", click)
      .on("mouseover", mouseOver)
      .on("mouseout", mouseOut);

  layerPostalArea.append("path")
      .datum(topojson.mesh(postalarea, postalarea.objects.PostalArea, function(a, b) { return a !== b; }))
      .attr("class", "postalarea-boundary")
      .attr("d", path);

  // Legend
  var formatNumber = d3.format(",r");
  var x = d3.scale.linear()
    .domain([0, 11000])  // Need to automate this
    .range([0, 500]); // Sets the screen width of the legend

  var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom")
    .tickSize(13)
    .tickValues(color.domain())
    .tickFormat(function(d) { return d >= 100 ? formatNumber(d) : null; });

  var key = svg.append("g")
      .attr("class", "key")
      .attr("transform", "translate(250,40)"); //Need to auto adjust this


  key.selectAll("rect")
    .data(color.range().map(function(d, i) {
      return {
        x0: i ? x(color.domain()[i - 1]) : x.range()[0],
        x1: i < color.domain().length ? x(color.domain()[i]) : x.range()[1],
        z: d
      };
    }))
  .enter().append("rect")
    .classed("colorbar",true)
    .attr("height", 8)
    .attr("x", function(d) { return d.x0; })
    .attr("width", function(d) { return d.x1 - d.x0; })
    .style("fill", function(d) { return d.z; })
    .style("stroke-width","0.5px")
    .style("stroke","black");

  key.call(xAxis).append("text")
    .attr("class", "caption")
    .attr("y", -6)
    .text("Population per square mile");


}