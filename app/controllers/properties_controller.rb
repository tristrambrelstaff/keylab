class PropertiesController < ApplicationController

  # GET /properties or /properties.json
  def index
    searcher = Property.searcher(params)
    @properties = Property.
      joins(searcher.joins.join(" ")).
      where([searcher.conds.join(" AND "), *searcher.vals]).
      paginate(page: params[:page])
  end

  # GET /properties/search
  def search
  end

  # GET /properties/1 or /properties/1.json
  def show
    @property = Property.find(params[:id])
  end

end
