class CoupletsController < ApplicationController

  before_action :authenticate_admin!, :only => [:create, :update, :destroy]

  # GET /couplets or /couplets.json
  def index
    searcher = Couplet.searcher(params)
    @couplets = Couplet.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /couplets/search
  def search
  end

  # GET /couplets/1 or /couplets/1.json
  def show
    @couplet = Couplet.find(params[:id])
  end

  # GET /couplets/new
  def new
    @couplet = Couplet.new
  end

  # GET /couplets/1/edit
  def edit
    @couplet = Couplet.find(params[:id])
  end

  # POST /couplets or /couplets.json
  def create
    @couplet = Couplet.new(couplet_params)
    respond_to do |format|
      if @couplet.save
        format.html { redirect_to couplet_url(@couplet), notice: "Couplet was successfully created." }
        format.json { render :show, status: :created, location: @couplet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @couplet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /couplets/1 or /couplets/1.json
  def update
    @couplet = Couplet.find(params[:id])
    respond_to do |format|
      if @couplet.update(couplet_params)
        format.html { redirect_to couplet_url(@couplet), notice: "Couplet was successfully updated." }
        format.json { render :show, status: :ok, location: @couplet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @couplet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /couplets/1 or /couplets/1.json
  def destroy
    @couplet = Couplet.find(params[:id])
    @couplet.destroy
    respond_to do |format|
      format.html { redirect_to couplets_url, notice: "Couplet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def couplet_params
      params.require(:couplet).permit(:ref, :key_id, :else_ref, :notes)
    end

end
