require "application_system_test_case"

class RolUsuariosTest < ApplicationSystemTestCase
  setup do
    @rol_usuario = rol_usuarios(:one)
  end

  test "visiting the index" do
    visit rol_usuarios_url
    assert_selector "h1", text: "Rol Usuarios"
  end

  test "creating a Rol usuario" do
    visit rol_usuarios_url
    click_on "New Rol Usuario"

    fill_in "Rol", with: @rol_usuario.rol_id
    fill_in "User", with: @rol_usuario.user_id
    click_on "Create Rol usuario"

    assert_text "Rol usuario was successfully created"
    click_on "Back"
  end

  test "updating a Rol usuario" do
    visit rol_usuarios_url
    click_on "Edit", match: :first

    fill_in "Rol", with: @rol_usuario.rol_id
    fill_in "User", with: @rol_usuario.user_id
    click_on "Update Rol usuario"

    assert_text "Rol usuario was successfully updated"
    click_on "Back"
  end

  test "destroying a Rol usuario" do
    visit rol_usuarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rol usuario was successfully destroyed"
  end
end
