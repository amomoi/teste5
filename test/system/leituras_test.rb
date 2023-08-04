require "application_system_test_case"

class LeiturasTest < ApplicationSystemTestCase
  setup do
    @leitura = leituras(:one)
  end

  test "visiting the index" do
    visit leituras_url
    assert_selector "h1", text: "Leituras"
  end

  test "creating a Leitura" do
    visit leituras_url
    click_on "New Leitura"

    fill_in "Sensor", with: @leitura.sensor_id
    fill_in "Valor", with: @leitura.valor
    click_on "Create Leitura"

    assert_text "Leitura was successfully created"
    click_on "Back"
  end

  test "updating a Leitura" do
    visit leituras_url
    click_on "Edit", match: :first

    fill_in "Sensor", with: @leitura.sensor_id
    fill_in "Valor", with: @leitura.valor
    click_on "Update Leitura"

    assert_text "Leitura was successfully updated"
    click_on "Back"
  end

  test "destroying a Leitura" do
    visit leituras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leitura was successfully destroyed"
  end
end
