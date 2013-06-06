function click(d) {
  var x, y, k;

  if (d && centered !== d) {
    var centroid = path.centroid(d);
    x = centroid[0];
    y = centroid[1];
    k = 10; // Zoom factor
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
  sidebarSel
        // .text(d.properties.WD11NM);
        .text(d.properties.AreaName + ' ' + d.id);
}
function mouseOut() {
  sidebarSel
        .text('');
}

function centre_and_bound(geojson_object) {
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
    .domain([.15, .30, .45, .60, .75])
    .range(["#f2f0f7", "#dadaeb", "#bcbddc", "#9e9ac8", "#756bb1", "#54278f"]);

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



// var zoom = d3.behavior.zoom()
//     .on("zoom",function() {
//         g.attr("transform","translate("+ 
//             d3.event.translate.join(",")+")scale("+d3.event.scale+")");
//         g.selectAll("path")  
//             .attr("d", path.projection(projection)); 
// });

// svg.call(zoom);

var layerUK = g.append("g");
var layerWard = g.append("g");
var layerPostalArea = g.append("g");

queue()
    .defer(d3.json, "/data/uk.json")
    // .defer(d3.json, "/data/ukwards.topo.json")
    .defer(d3.json, "/data/PostalArea.topo.json")
    .defer(d3.csv, "/data/census_by_postcodearea.csv")
    .await(ready);

function ready(error, uk, postalarea, census) {
  var subunits = topojson.feature(uk, uk.objects.subunits);
  // var wards = topojson.feature(ward, ward.objects.ukwards);
  var postalareas = topojson.feature(postalarea, postalarea.objects.PostalArea);


  console.log(census);

  // Processing of census to get unemployment rate
  var rateById = {};
  census.forEach(function(d) { rateById[d.PostArea] = (+d.Tot16to74 -d.TotEmploy) / (+d.Tot16to74); });
  console.log(rateById);
  console.log(rateById['AB']);
  console.log(color(rateById['AB']));
  console.log(color(undefined));


  centre_and_bound(postalareas);

  // layerUK.selectAll(".subunit")
  //     .data(subunits.features)
  //   .enter().append("path")
  //     .attr("class", function(d) { return "subunit " +d.id; })
  //     .attr("d", path);


  layerUK.append("path")
      .datum(topojson.mesh(uk, uk.objects.subunits))
      .attr("class", "subunit-boundary")
      .attr("d", path);

  // layerWard.selectAll(".wards")
  //   .data(wards.features)
  //   .enter().append("path")
  //   .attr("class", "wards")
  //   .attr("id", function(d) {return d.id;})
  //   .attr("d", path)
  //   .on("click", click)
  //   .on("mouseover", mouseOver)
  //   .on("mouseout", mouseOut);

  layerPostalArea.selectAll(".postalareas")
    .data(postalareas.features)
    .enter().append("path")
    .attr("class", "postalareas")
    .attr("id", function(d) {return d.id;})
    .style("fill", function(d) { return myColor = rateById[d.id] ? color(rateById[d.id]) : "#FFFFFF"; })
    .attr("d", path)
    .on("click", click)
    .on("mouseover", mouseOver)
    .on("mouseout", mouseOut);
}