class CreatePredicatesPropertiesAndTaxons < ActiveRecord::Migration[7.0]

  def change

    create_table :predicates do |t|
      t.string :type
      t.integer :predicate_id
      t.integer :predicate_id_1
      t.integer :predicate_id_2
      t.integer :property_id
      t.integer :taxon_id
    end

    create_table :properties do |t|
      t.text :text
    end

    create_table :taxons do |t|
      t.text :text
    end

  end

end
