class AddXmlToDocumentsAndKeys < ActiveRecord::Migration[7.0]

  def change

    add_column :documents, :xml, :text
    add_column :keys,      :xml, :text

  end

end
