class CreateCoupletsLeadsObservationsAndConclusions < ActiveRecord::Migration[7.0]

  def change

    create_table :couplets do |t|
      t.string :ref
      t.integer :key_id
      t.string :else_ref
      t.text :notes
      t.timestamps
    end

    create_table :leads do |t|
      t.integer :couplet_id
      t.string :then_ref
      t.integer :observation_id
      t.integer :conclusion_id
      t.timestamps
    end

    create_table :observations do |t|
      t.string :type
      t.text :text
      t.text :notes
      t.integer :observation_id
      t.integer :other_observation_id
      t.timestamps
    end

    create_table :conclusions do |t|
      t.string :type
      t.text :text
      t.text :notes
      t.integer :conclusion_id
      t.integer :other_conclusion_id
      t.timestamps
    end

  end

end
