class Taxon < ApplicationRecord

  require "empty_where_fix"

  def to_s
    text
  end

  def Taxon.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "taxons.id = ?"
      vals << params[:id]
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => empty_where_fix(conds),
      :vals => vals
    )
  end

end
