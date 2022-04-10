require "test_helper"

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get documents_url
    assert_response :success
  end

  test "should get new" do
    get new_document_url
    assert_response :success
  end

  test "should create document" do
    assert_difference("Document.count") do
      post documents_url, params: { document: { archived_file_url: @document.archived_file_url, archived_page_url: @document.archived_page_url, citation: @document.citation, language: @document.language, original_file_url: @document.original_file_url, original_page_url: @document.original_page_url, ref: @document.ref } }
    end

    assert_redirected_to document_url(Document.last)
  end

  test "should show document" do
    get document_url(@document)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_url(@document)
    assert_response :success
  end

  test "should update document" do
    patch document_url(@document), params: { document: { archived_file_url: @document.archived_file_url, archived_page_url: @document.archived_page_url, citation: @document.citation, language: @document.language, original_file_url: @document.original_file_url, original_page_url: @document.original_page_url, ref: @document.ref } }
    assert_redirected_to document_url(@document)
  end

  test "should destroy document" do
    assert_difference("Document.count", -1) do
      delete document_url(@document)
    end

    assert_redirected_to documents_url
  end
end
