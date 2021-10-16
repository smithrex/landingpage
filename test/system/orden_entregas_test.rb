require "application_system_test_case"

class OrdenEntregasTest < ApplicationSystemTestCase
  setup do
    @orden_entrega = orden_entregas(:one)
  end

  test "visiting the index" do
    visit orden_entregas_url
    assert_selector "h1", text: "Orden Entregas"
  end

  test "creating a Orden entrega" do
    visit orden_entregas_url
    click_on "New Orden Entrega"

    fill_in "Direccion", with: @orden_entrega.direccion
    fill_in "Fecha", with: @orden_entrega.fecha
    fill_in "Instrucciones", with: @orden_entrega.instrucciones
    fill_in "Orden", with: @orden_entrega.orden_id
    click_on "Create Orden entrega"

    assert_text "Orden entrega was successfully created"
    click_on "Back"
  end

  test "updating a Orden entrega" do
    visit orden_entregas_url
    click_on "Edit", match: :first

    fill_in "Direccion", with: @orden_entrega.direccion
    fill_in "Fecha", with: @orden_entrega.fecha
    fill_in "Instrucciones", with: @orden_entrega.instrucciones
    fill_in "Orden", with: @orden_entrega.orden_id
    click_on "Update Orden entrega"

    assert_text "Orden entrega was successfully updated"
    click_on "Back"
  end

  test "destroying a Orden entrega" do
    visit orden_entregas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orden entrega was successfully destroyed"
  end
end
