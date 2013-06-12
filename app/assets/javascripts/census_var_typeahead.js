$(document).ready(function() {
	$('.typeahead').typeahead({
	  prefetch: '../census_vars.json',
	  name: 'censusvars',
	  valueKey: 'varlabel',
	  limit: 200,
	  template: [                                                                 
	    '<a href="{{varlabel}}">',
	    '<p class="censusvar-label">{{varlabel}}</p>',                              
	    '<p class="censusvar-units">{{units}}</p>',                                      
	    '<p class="censusvar-longlabel">{{longlabel}}</p>',
	    '</a>'                         
	  ].join(''),                                                                 
	  engine: Hogan                                                               
	}).on('typeahead:selected', function(event, data) {
      	window.location.href='/census_counts/'+data.varlabel;
	});
});
