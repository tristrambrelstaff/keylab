class TaxonsController < ApplicationController

  before_action :authenticate_admin!, :only => [:create, :update, :destroy]

  # GET /taxons or /taxons.json
  def index
    searcher = Taxon.searcher(params)
    @taxons = Taxon.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /taxons/search
  def search
  end

  # GET /taxons/1 or /taxons/1.json
  def show
    @taxon = Taxon.find(params[:id])
  end

  # GET /taxons/new
  def new
    @taxon = Taxon.new
  end

  # GET /taxons/1/edit
  def edit
    @taxon = Taxon.find(params[:id])
  end

  # POST /taxons or /taxons.json
  def create
    @taxon = Taxon.new(taxon_params)
    respond_to do |format|
      if @taxon.save
        format.html { redirect_to taxon_url(@taxon), notice: "Taxon was successfully created." }
        format.json { render :show, status: :created, location: @taxon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxons/1 or /taxons/1.json
  def update
    @taxon = Taxon.find(params[:id])
    respond_to do |format|
      if @taxon.update(taxon_params)
        format.html { redirect_to taxon_url(@taxon), notice: "Taxon was successfully updated." }
        format.json { render :show, status: :ok, location: @taxon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxons/1 or /taxons/1.json
  def destroy
    @taxon = Taxon.find(params[:id])
    @taxon.destroy
    respond_to do |format|
      format.html { redirect_to taxons_url, notice: "Taxon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def taxon_params
      params.require(:taxon).permit(:text)
    end

end
