class CensusVarsController < ApplicationController
  # GET /census_vars
  # GET /census_vars.json
  def index
    @census_vars = CensusVar.all
    @longlabels = CensusVar.select(:longlabel)

    # could put this into the model with a callback or seed
    @census_vars.each_with_index do |census_var, i|
    	census_var.tokens = census_var.longlabel.to_s.split(' ')
    	census_var.tokens.append @census_vars[i][:varlabel]
    	census_var.tokens.append 'all'
    end

    respond_to do |format|
      format.json
    end
  end
end
