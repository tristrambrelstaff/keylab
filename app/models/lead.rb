class Lead < ApplicationRecord

  require "empty_where_fix"

  def Lead.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "leads.id = ?"
      vals << params[:id]
    end
    unless params[:ref].blank?
      conds << "leads.ref LIKE ?"
      vals << "%#{params[:ref]}%"
    end
    unless params[:couplet_id].blank?
      conds << "leads.couplet_id = ?"
      vals << params[:couplet_id]
    end
    unless params[:then_ref].blank?
      conds << "leads.then_ref = ?"
      vals << params[:then_ref]
    end
    unless params[:observation_id].blank?
      conds << "leads.observation_id = ?"
      vals << params[:observation_id]
    end
    unless params[:conclusion_id].blank?
      conds << "leads.conclusion_id = ?"
      vals << params[:conclusion_id]
    end
    unless params[:notes].blank?
      conds << "leads.notes LIKE ?"
      vals << "%#{params[:notes]}%"
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => empty_where_fix(conds),
      :vals => vals
    )
  end

end
