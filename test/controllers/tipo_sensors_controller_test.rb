require "test_helper"

class TipoSensorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_sensor = tipo_sensors(:one)
  end

  test "should get index" do
    get tipo_sensors_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_sensor_url
    assert_response :success
  end

  test "should create tipo_sensor" do
    assert_difference('TipoSensor.count') do
      post tipo_sensors_url, params: { tipo_sensor: { tipo_sensor: @tipo_sensor.tipo_sensor } }
    end

    assert_redirected_to tipo_sensor_url(TipoSensor.last)
  end

  test "should show tipo_sensor" do
    get tipo_sensor_url(@tipo_sensor)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_sensor_url(@tipo_sensor)
    assert_response :success
  end

  test "should update tipo_sensor" do
    patch tipo_sensor_url(@tipo_sensor), params: { tipo_sensor: { tipo_sensor: @tipo_sensor.tipo_sensor } }
    assert_redirected_to tipo_sensor_url(@tipo_sensor)
  end

  test "should destroy tipo_sensor" do
    assert_difference('TipoSensor.count', -1) do
      delete tipo_sensor_url(@tipo_sensor)
    end

    assert_redirected_to tipo_sensors_url
  end
end
