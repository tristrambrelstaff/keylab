class TaxonsController < ApplicationController

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

end
