class PredicatesController < ApplicationController

  # GET /predicates or /predicates.json
  def index
    searcher = Predicate.searcher(params)
    @predicates = Predicate.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /predicates/search
  def search
  end

  # GET /predicates/1 or /predicates/1.json
  def show
    @predicate = Predicate.find(params[:id])
  end

end
