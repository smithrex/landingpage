require "test_helper"

class OrdenProyectosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_proyecto = orden_proyectos(:one)
  end

  test "should get index" do
    get orden_proyectos_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_proyecto_url
    assert_response :success
  end

  test "should create orden_proyecto" do
    assert_difference('OrdenProyecto.count') do
      post orden_proyectos_url, params: { orden_proyecto: { instrucciones: @orden_proyecto.instrucciones, orden_id: @orden_proyecto.orden_id, proyecto_id: @orden_proyecto.proyecto_id } }
    end

    assert_redirected_to orden_proyecto_url(OrdenProyecto.last)
  end

  test "should show orden_proyecto" do
    get orden_proyecto_url(@orden_proyecto)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_proyecto_url(@orden_proyecto)
    assert_response :success
  end

  test "should update orden_proyecto" do
    patch orden_proyecto_url(@orden_proyecto), params: { orden_proyecto: { instrucciones: @orden_proyecto.instrucciones, orden_id: @orden_proyecto.orden_id, proyecto_id: @orden_proyecto.proyecto_id } }
    assert_redirected_to orden_proyecto_url(@orden_proyecto)
  end

  test "should destroy orden_proyecto" do
    assert_difference('OrdenProyecto.count', -1) do
      delete orden_proyecto_url(@orden_proyecto)
    end

    assert_redirected_to orden_proyectos_url
  end
end
