class CreateKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :keys do |t|
      t.string :ref
      t.integer :document_id
      t.text :title
      t.string :language
      t.text :notes

      t.timestamps
    end
  end
end
