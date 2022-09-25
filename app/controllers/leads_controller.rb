class LeadsController < ApplicationController

  # GET /leads or /leads.json
  def index
    searcher = Lead.searcher(params)
    @leads = Lead.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /leads/search
  def search
  end

  # GET /leads/1 or /leads/1.json
  def show
    @lead = Lead.find(params[:id])
  end

end
