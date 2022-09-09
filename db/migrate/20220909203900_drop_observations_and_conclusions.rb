class DropObservationsAndConclusions < ActiveRecord::Migration[7.0]

  def up
    drop_table :observations
    drop_table :conclusions
    remove_column :leads, :observation_id
    remove_column :leads, :conclusion_id
  end

  def down
    create_table :observations do |t|
      t.string :observation_type
      t.text :text
      t.text :notes
      t.integer :observation_id
      t.integer :other_observation_id
      t.timestamps
    end
    create_table :conclusions do |t|
      t.string :conclusion_type
      t.text :text
      t.text :notes
      t.integer :conclusion_id
      t.integer :other_conclusion_id
      t.timestamps
    end
    add_column :leads, :observation_id, :integer, :after => :then_ref
    add_column :leads, :conclusion_id, :integer, :after => :observation_id
  end

end
