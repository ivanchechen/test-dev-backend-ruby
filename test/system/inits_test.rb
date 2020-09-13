require "application_system_test_case"

class InitsTest < ApplicationSystemTestCase
  setup do
    @init = inits(:one)
  end

  test "visiting the index" do
    visit inits_url
    assert_selector "h1", text: "Inits"
  end

  test "creating a Init" do
    visit inits_url
    click_on "New Init"

    fill_in "Entrada", with: @init.entrada
    click_on "Create Init"

    assert_text "Init was successfully created"
    click_on "Back"
  end

  test "updating a Init" do
    visit inits_url
    click_on "Edit", match: :first

    fill_in "Entrada", with: @init.entrada
    click_on "Update Init"

    assert_text "Init was successfully updated"
    click_on "Back"
  end

  test "destroying a Init" do
    visit inits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Init was successfully destroyed"
  end
end
