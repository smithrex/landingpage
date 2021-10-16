require "application_system_test_case"

class OrdenProyectosTest < ApplicationSystemTestCase
  setup do
    @orden_proyecto = orden_proyectos(:one)
  end

  test "visiting the index" do
    visit orden_proyectos_url
    assert_selector "h1", text: "Orden Proyectos"
  end

  test "creating a Orden proyecto" do
    visit orden_proyectos_url
    click_on "New Orden Proyecto"

    fill_in "Instrucciones", with: @orden_proyecto.instrucciones
    fill_in "Orden", with: @orden_proyecto.orden_id
    fill_in "Proyecto", with: @orden_proyecto.proyecto_id
    click_on "Create Orden proyecto"

    assert_text "Orden proyecto was successfully created"
    click_on "Back"
  end

  test "updating a Orden proyecto" do
    visit orden_proyectos_url
    click_on "Edit", match: :first

    fill_in "Instrucciones", with: @orden_proyecto.instrucciones
    fill_in "Orden", with: @orden_proyecto.orden_id
    fill_in "Proyecto", with: @orden_proyecto.proyecto_id
    click_on "Update Orden proyecto"

    assert_text "Orden proyecto was successfully updated"
    click_on "Back"
  end

  test "destroying a Orden proyecto" do
    visit orden_proyectos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orden proyecto was successfully destroyed"
  end
end
