class ConclusionsController < ApplicationController

  before_action :authenticate_admin!, :only => [:create, :update, :destroy]

  # GET /conclusions or /conclusions.json
  def index
    searcher = Conclusion.searcher(params)
    @conclusions = Conclusion.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /conclusions/search
  def search
  end

  # GET /conclusions/1 or /conclusions/1.json
  def show
    @conclusion = Conclusion.find(params[:id])
  end

  # GET /conclusions/new
  def new
    @conclusion = Conclusion.new
  end

  # GET /conclusions/1/edit
  def edit
    @conclusion = Conclusion.find(params[:id])
  end

  # POST /conclusions or /conclusions.json
  def create
    @conclusion = Conclusion.new(conclusion_params)
    respond_to do |format|
      if @conclusion.save
        format.html { redirect_to conclusion_url(@conclusion), notice: "Conclusion was successfully created." }
        format.json { render :show, status: :created, location: @conclusion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conclusions/1 or /conclusions/1.json
  def update
    @conclusion = Conclusion.find(params[:id])
    respond_to do |format|
      if @conclusion.update(conclusion_params)
        format.html { redirect_to conclusion_url(@conclusion), notice: "Conclusion was successfully updated." }
        format.json { render :show, status: :ok, location: @conclusion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conclusions/1 or /conclusions/1.json
  def destroy
    @conclusion = Conclusion.find(params[:id])
    @conclusion.destroy
    respond_to do |format|
      format.html { redirect_to conclusions_url, notice: "Conclusion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def conclusion_params
      params.require(:conclusion).permit(:conclusion_type, :text, :notes, :conclusion_id, :other_conclusion_id)
    end

end
