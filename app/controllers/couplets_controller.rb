class CoupletsController < ApplicationController

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

end
