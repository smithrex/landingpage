require "test_helper"

class OrdenProductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_producto = orden_productos(:one)
  end

  test "should get index" do
    get orden_productos_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_producto_url
    assert_response :success
  end

  test "should create orden_producto" do
    assert_difference('OrdenProducto.count') do
      post orden_productos_url, params: { orden_producto: { cantidad: @orden_producto.cantidad, descuento: @orden_producto.descuento, instrucciones: @orden_producto.instrucciones, orden_id: @orden_producto.orden_id, precio: @orden_producto.precio, producto_id: @orden_producto.producto_id } }
    end

    assert_redirected_to orden_producto_url(OrdenProducto.last)
  end

  test "should show orden_producto" do
    get orden_producto_url(@orden_producto)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_producto_url(@orden_producto)
    assert_response :success
  end

  test "should update orden_producto" do
    patch orden_producto_url(@orden_producto), params: { orden_producto: { cantidad: @orden_producto.cantidad, descuento: @orden_producto.descuento, instrucciones: @orden_producto.instrucciones, orden_id: @orden_producto.orden_id, precio: @orden_producto.precio, producto_id: @orden_producto.producto_id } }
    assert_redirected_to orden_producto_url(@orden_producto)
  end

  test "should destroy orden_producto" do
    assert_difference('OrdenProducto.count', -1) do
      delete orden_producto_url(@orden_producto)
    end

    assert_redirected_to orden_productos_url
  end
end
