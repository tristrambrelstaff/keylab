class Key < ApplicationRecord

  require "sqlite_fix"

  belongs_to :document

  def Key.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "keys.id = ?"
      vals << params[:id]
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => sqlite_fix(conds),
      :vals => vals
    )
  end

end
