class Couplet < ApplicationRecord

  require "empty_where_fix"

  def Couplet.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "couplets.id = ?"
      vals << params[:id]
    end
    unless params[:ref].blank?
      conds << "couplets.ref = ?"
      vals << params[:ref]
    end
    unless params[:else_ref].blank?
      conds << "couplets.else_ref = ?"
      vals << params[:else_ref]
    end
    unless params[:notes].blank?
      conds << "couplets.notes LIKE ?"
      vals << "%#{params[:notes]}%"
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => empty_where_fix(conds),
      :vals => vals
    )
  end

end
