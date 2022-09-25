class KeysController < ApplicationController

  # GET /keys or /keys.json
  def index
    searcher = Key.searcher(params)
    @keys = Key.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /keys/search
  def search
  end

  # GET /keys/1 or /keys/1.json
  def show
    @key = Key.find(params[:id])
  end

end
