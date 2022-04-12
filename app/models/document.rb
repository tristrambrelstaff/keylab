class Document < ApplicationRecord

  has_many :keys

  def Document.ref_id_pairs
    Document.all.collect{|document|
      [document.ref, document.id]
    }.sort
  end

end
