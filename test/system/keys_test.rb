require "application_system_test_case"

class KeysTest < ApplicationSystemTestCase
  setup do
    @key = keys(:one)
  end

  test "visiting the index" do
    visit keys_url
    assert_selector "h1", text: "Keys"
  end

  test "should create key" do
    visit keys_url
    click_on "New key"

    fill_in "Document", with: @key.document_id
    fill_in "Language", with: @key.language
    fill_in "Notes", with: @key.notes
    fill_in "Ref", with: @key.ref
    fill_in "Title", with: @key.title
    click_on "Create Key"

    assert_text "Key was successfully created"
    click_on "Back"
  end

  test "should update Key" do
    visit key_url(@key)
    click_on "Edit this key", match: :first

    fill_in "Document", with: @key.document_id
    fill_in "Language", with: @key.language
    fill_in "Notes", with: @key.notes
    fill_in "Ref", with: @key.ref
    fill_in "Title", with: @key.title
    click_on "Update Key"

    assert_text "Key was successfully updated"
    click_on "Back"
  end

  test "should destroy Key" do
    visit key_url(@key)
    click_on "Destroy this key", match: :first

    assert_text "Key was successfully destroyed"
  end
end
