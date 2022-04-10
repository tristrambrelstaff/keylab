require "application_system_test_case"

class DocumentsTest < ApplicationSystemTestCase
  setup do
    @document = documents(:one)
  end

  test "visiting the index" do
    visit documents_url
    assert_selector "h1", text: "Documents"
  end

  test "should create document" do
    visit documents_url
    click_on "New document"

    fill_in "Archived file url", with: @document.archived_file_url
    fill_in "Archived page url", with: @document.archived_page_url
    fill_in "Citation", with: @document.citation
    fill_in "Language", with: @document.language
    fill_in "Original file url", with: @document.original_file_url
    fill_in "Original page url", with: @document.original_page_url
    fill_in "Ref", with: @document.ref
    click_on "Create Document"

    assert_text "Document was successfully created"
    click_on "Back"
  end

  test "should update Document" do
    visit document_url(@document)
    click_on "Edit this document", match: :first

    fill_in "Archived file url", with: @document.archived_file_url
    fill_in "Archived page url", with: @document.archived_page_url
    fill_in "Citation", with: @document.citation
    fill_in "Language", with: @document.language
    fill_in "Original file url", with: @document.original_file_url
    fill_in "Original page url", with: @document.original_page_url
    fill_in "Ref", with: @document.ref
    click_on "Update Document"

    assert_text "Document was successfully updated"
    click_on "Back"
  end

  test "should destroy Document" do
    visit document_url(@document)
    click_on "Destroy this document", match: :first

    assert_text "Document was successfully destroyed"
  end
end
