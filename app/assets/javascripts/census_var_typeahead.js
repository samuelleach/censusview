$(document).ready(function() {
	$('.typeahead').typeahead({
	  prefetch: '../census_vars.json',
	  name: 'censusvars',
	  valueKey: 'varlabel',
	  limit: 200,
	  template: [                                                                 
	    '<p class="censusvar-label">{{varlabel}}</p>',                              
	    '<p class="censusvar-units">{{units}}</p>',                                      
	    '<p class="censusvar-longlabel">{{longlabel}}</p>'                         
	  ].join(''),                                                                 
	  engine: Hogan                                                               
	});
});
