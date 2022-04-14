class Document < ApplicationRecord

  require "sqlite_fix"

  has_many :keys

  def Document.ref_id_pairs
    Document.all.collect{|document|
      [document.ref, document.id]
    }.sort
  end

  def Document.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "documents.id = ?"
      vals << params[:id]
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => sqlite_fix(conds),
      :vals => vals
    )
  end

end
