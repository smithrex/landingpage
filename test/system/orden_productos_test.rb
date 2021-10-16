require "application_system_test_case"

class OrdenProductosTest < ApplicationSystemTestCase
  setup do
    @orden_producto = orden_productos(:one)
  end

  test "visiting the index" do
    visit orden_productos_url
    assert_selector "h1", text: "Orden Productos"
  end

  test "creating a Orden producto" do
    visit orden_productos_url
    click_on "New Orden Producto"

    fill_in "Cantidad", with: @orden_producto.cantidad
    fill_in "Descuento", with: @orden_producto.descuento
    fill_in "Instrucciones", with: @orden_producto.instrucciones
    fill_in "Orden", with: @orden_producto.orden_id
    fill_in "Precio", with: @orden_producto.precio
    fill_in "Producto", with: @orden_producto.producto_id
    click_on "Create Orden producto"

    assert_text "Orden producto was successfully created"
    click_on "Back"
  end

  test "updating a Orden producto" do
    visit orden_productos_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @orden_producto.cantidad
    fill_in "Descuento", with: @orden_producto.descuento
    fill_in "Instrucciones", with: @orden_producto.instrucciones
    fill_in "Orden", with: @orden_producto.orden_id
    fill_in "Precio", with: @orden_producto.precio
    fill_in "Producto", with: @orden_producto.producto_id
    click_on "Update Orden producto"

    assert_text "Orden producto was successfully updated"
    click_on "Back"
  end

  test "destroying a Orden producto" do
    visit orden_productos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orden producto was successfully destroyed"
  end
end
