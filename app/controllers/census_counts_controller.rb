class CensusCountsController < ApplicationController
  # GET /census_counts
  # GET /census_counts.json
  def index
    @census_counts = CensusCount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @census_counts }
    end
  end

  # GET /census_counts/1
  # GET /census_counts/1.json
  def show
    @census_count = CensusCount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @census_count }
    end
  end

  # GET /census_counts/new
  # GET /census_counts/new.json
  def new
    @census_count = CensusCount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @census_count }
    end
  end

  # GET /census_counts/1/edit
  def edit
    @census_count = CensusCount.find(params[:id])
  end

  # POST /census_counts
  # POST /census_counts.json
  def create
    @census_count = CensusCount.new(params[:census_count])

    respond_to do |format|
      if @census_count.save
        format.html { redirect_to @census_count, notice: 'Census count was successfully created.' }
        format.json { render json: @census_count, status: :created, location: @census_count }
      else
        format.html { render action: "new" }
        format.json { render json: @census_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /census_counts/1
  # PUT /census_counts/1.json
  def update
    @census_count = CensusCount.find(params[:id])

    respond_to do |format|
      if @census_count.update_attributes(params[:census_count])
        format.html { redirect_to @census_count, notice: 'Census count was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @census_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /census_counts/1
  # DELETE /census_counts/1.json
  def destroy
    @census_count = CensusCount.find(params[:id])
    @census_count.destroy

    respond_to do |format|
      format.html { redirect_to census_counts_url }
      format.json { head :no_content }
    end
  end
end
