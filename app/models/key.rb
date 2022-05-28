class Key < ApplicationRecord

  require "empty_where_fix"

  belongs_to :document

  def Key.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "keys.id = ?"
      vals << params[:id]
    end
    unless params[:ref].blank?
      conds << "keys.ref LIKE ?"
      vals << "%#{params[:ref]}%"
    end
    unless params[:document_ref].blank?
      joins << "JOIN documents ON documents.id = keys.document_id"
      conds << "documents.ref LIKE ?"
      vals << "%#{params[:document_ref]}%"
    end
    unless params[:document_id].blank?
      conds << "keys.document_id = ?"
      vals << params[:document_id]
    end
    unless params[:title].blank?
      conds << "keys.title LIKE ?"
      vals << "%#{params[:title]}%"
    end
    unless params[:language].blank?
      conds << "keys.language = ?"
      vals << params[:language]
    end
    unless params[:notes].blank?
      conds << "keys.notes LIKE ?"
      vals << "%#{params[:notes]}%"
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => empty_where_fix(conds),
      :vals => vals
    )
  end

end
