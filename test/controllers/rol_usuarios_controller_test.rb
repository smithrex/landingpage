require "test_helper"

class RolUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rol_usuario = rol_usuarios(:one)
  end

  test "should get index" do
    get rol_usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_rol_usuario_url
    assert_response :success
  end

  test "should create rol_usuario" do
    assert_difference('RolUsuario.count') do
      post rol_usuarios_url, params: { rol_usuario: { rol_id: @rol_usuario.rol_id, user_id: @rol_usuario.user_id } }
    end

    assert_redirected_to rol_usuario_url(RolUsuario.last)
  end

  test "should show rol_usuario" do
    get rol_usuario_url(@rol_usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_rol_usuario_url(@rol_usuario)
    assert_response :success
  end

  test "should update rol_usuario" do
    patch rol_usuario_url(@rol_usuario), params: { rol_usuario: { rol_id: @rol_usuario.rol_id, user_id: @rol_usuario.user_id } }
    assert_redirected_to rol_usuario_url(@rol_usuario)
  end

  test "should destroy rol_usuario" do
    assert_difference('RolUsuario.count', -1) do
      delete rol_usuario_url(@rol_usuario)
    end

    assert_redirected_to rol_usuarios_url
  end
end
