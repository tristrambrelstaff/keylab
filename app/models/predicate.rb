class Predicate < ApplicationRecord

  require "empty_where_fix"

  def Predicate.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "predicates.id = ?"
      vals << params[:id]
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => empty_where_fix(conds),
      :vals => vals
    )
  end

end


class And < Predicate

  belongs_to :predicate_1, :class_name => "Predicate"
  belongs_to :predicate_2, :class_name => "Predicate"
  validates_presence_of :predicate_1, :predicate_2

  def to_s
    "(#{predicate_1.to_s}) AND (#{predicate_2.to_s})"
  end

end


class Or < Predicate

  belongs_to :predicate_1, :class_name => "Predicate"
  belongs_to :predicate_2, :class_name => "Predicate"
  validates_presence_of :predicate_1, :predicate_2

  def to_s
    "(#{predicate_1.to_s}) OR (#{predicate_2.to_s})"
  end

end


class Not < Predicate

  belongs_to :predicate
  validates_presence_of :predicate

  def to_s
    "NOT (#{predicate.to_s})"
  end

end


class Has < Predicate

  belongs_to :property
  validates_presence_of :property

  def to_s
    property.to_s
  end

end


class Is < Predicate

  belongs_to :taxon
  validates_presence_of :taxon

  def to_s
    taxon.to_s
  end

end
