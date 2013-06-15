$(document).ready(function() {
	$('.typeahead').typeahead({
	  // prefetch: '../census_vars.json',
	  prefetch:
	  	{
	  		url: '../census_vars.json',
	  		filter: function(parsedResponse) {
	  			 for (var i = 0; i < parsedResponse.length; i++) {
  					parsedResponse[i]['tokens'] = ['all',parsedResponse[i].vartype,
  												parsedResponse[i].units,
  												parsedResponse[i].varlabel];
  					longlabel_tokens = parsedResponse[i].longlabel.split(" ");
  					for (var j = 0; j < longlabel_tokens.length; j++) {
  						parsedResponse[i].tokens.push(longlabel_tokens[j]);
  					}
				  };
				 return parsedResponse;
	  		}
	  	},
	  name: 'censusvars',
	  valueKey: 'varlabel',
	  limit: 200,
	  template: [                                                                 
	    '<a href="{{varlabel}}">',
	    '<p class="censusvar-label">{{varlabel}}</p>',                              
	    '<p class="censusvar-units">{{units}} ({{vartype}})</p>',                                      
	    '<p class="censusvar-longlabel">{{longlabel}}</p>',
	    '</a>'                         
	  ].join(''),                                                                 
	  engine: Hogan                                                               
	}).on('typeahead:selected', function(event, data) {
      	window.location.href='/census_counts/'+data.varlabel;
	});
});
