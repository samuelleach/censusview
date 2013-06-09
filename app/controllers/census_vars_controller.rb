class CensusVarsController < ApplicationController
  # GET /census_vars
  # GET /census_vars.json
  def index
    @census_vars = CensusVar.all

    respond_to do |format|
      format.json
    end
  end
end
