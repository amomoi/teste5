require "test_helper"

class LeiturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leitura = leituras(:one)
  end

  test "should get index" do
    get leituras_url
    assert_response :success
  end

  test "should get new" do
    get new_leitura_url
    assert_response :success
  end

  test "should create leitura" do
    assert_difference('Leitura.count') do
      post leituras_url, params: { leitura: { sensor_id: @leitura.sensor_id, valor: @leitura.valor } }
    end

    assert_redirected_to leitura_url(Leitura.last)
  end

  test "should show leitura" do
    get leitura_url(@leitura)
    assert_response :success
  end

  test "should get edit" do
    get edit_leitura_url(@leitura)
    assert_response :success
  end

  test "should update leitura" do
    patch leitura_url(@leitura), params: { leitura: { sensor_id: @leitura.sensor_id, valor: @leitura.valor } }
    assert_redirected_to leitura_url(@leitura)
  end

  test "should destroy leitura" do
    assert_difference('Leitura.count', -1) do
      delete leitura_url(@leitura)
    end

    assert_redirected_to leituras_url
  end
end
