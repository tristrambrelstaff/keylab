json.extract! document, :id, :ref, :citation, :language, :original_file_url, :archived_file_url, :original_page_url, :archived_page_url, :xml, :created_at, :updated_at
json.url document_url(document, format: :json)
