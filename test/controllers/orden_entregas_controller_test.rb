require "test_helper"

class OrdenEntregasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_entrega = orden_entregas(:one)
  end

  test "should get index" do
    get orden_entregas_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_entrega_url
    assert_response :success
  end

  test "should create orden_entrega" do
    assert_difference('OrdenEntrega.count') do
      post orden_entregas_url, params: { orden_entrega: { direccion: @orden_entrega.direccion, fecha: @orden_entrega.fecha, instrucciones: @orden_entrega.instrucciones, orden_id: @orden_entrega.orden_id } }
    end

    assert_redirected_to orden_entrega_url(OrdenEntrega.last)
  end

  test "should show orden_entrega" do
    get orden_entrega_url(@orden_entrega)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_entrega_url(@orden_entrega)
    assert_response :success
  end

  test "should update orden_entrega" do
    patch orden_entrega_url(@orden_entrega), params: { orden_entrega: { direccion: @orden_entrega.direccion, fecha: @orden_entrega.fecha, instrucciones: @orden_entrega.instrucciones, orden_id: @orden_entrega.orden_id } }
    assert_redirected_to orden_entrega_url(@orden_entrega)
  end

  test "should destroy orden_entrega" do
    assert_difference('OrdenEntrega.count', -1) do
      delete orden_entrega_url(@orden_entrega)
    end

    assert_redirected_to orden_entregas_url
  end
end
