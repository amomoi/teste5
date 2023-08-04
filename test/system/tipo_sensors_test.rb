require "application_system_test_case"

class TipoSensorsTest < ApplicationSystemTestCase
  setup do
    @tipo_sensor = tipo_sensors(:one)
  end

  test "visiting the index" do
    visit tipo_sensors_url
    assert_selector "h1", text: "Tipo Sensors"
  end

  test "creating a Tipo sensor" do
    visit tipo_sensors_url
    click_on "New Tipo Sensor"

    fill_in "Tipo sensor", with: @tipo_sensor.tipo_sensor
    click_on "Create Tipo sensor"

    assert_text "Tipo sensor was successfully created"
    click_on "Back"
  end

  test "updating a Tipo sensor" do
    visit tipo_sensors_url
    click_on "Edit", match: :first

    fill_in "Tipo sensor", with: @tipo_sensor.tipo_sensor
    click_on "Update Tipo sensor"

    assert_text "Tipo sensor was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo sensor" do
    visit tipo_sensors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo sensor was successfully destroyed"
  end
end
