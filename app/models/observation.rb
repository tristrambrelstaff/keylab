class Observation < ApplicationRecord

  require "empty_where_fix"

  def Observation.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "observations.id = ?"
      vals << params[:id]
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => empty_where_fix(conds),
      :vals => vals
    )
  end

end
