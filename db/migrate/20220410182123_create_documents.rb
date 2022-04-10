class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :ref
      t.text :citation
      t.string :language
      t.text :original_file_url
      t.text :archived_file_url
      t.text :original_page_url
      t.text :archived_page_url

      t.timestamps
    end
  end
end
