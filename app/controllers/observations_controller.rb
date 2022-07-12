class ObservationsController < ApplicationController

  before_action :authenticate_admin!, :only => [:create, :update, :destroy]

  # GET /observations or /observations.json
  def index
    searcher = Observation.searcher(params)
    @observations = Observation.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /observations/search
  def search
  end

  # GET /observations/1 or /observations/1.json
  def show
    @observation = Observation.find(params[:id])
  end

  # GET /observations/new
  def new
    @observation = Observation.new
  end

  # GET /observations/1/edit
  def edit
    @observation = Observation.find(params[:id])
  end

  # POST /observations or /observations.json
  def create
    @observation = Observation.new(observation_params)
    respond_to do |format|
      if @observation.save
        format.html { redirect_to observation_url(@observation), notice: "Observation was successfully created." }
        format.json { render :show, status: :created, location: @observation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observations/1 or /observations/1.json
  def update
    @observation = Observation.find(params[:id])
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to observation_url(@observation), notice: "Observation was successfully updated." }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1 or /observations/1.json
  def destroy
    @observation = Observation.find(params[:id])
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to observations_url, notice: "Observation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def observation_params
      params.require(:observation).permit(:observation_type, :text, :notes, :observation_id, :other_observation_id)
    end

end
