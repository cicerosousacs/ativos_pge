require 'test_helper'

class AdminsAtivo::UsuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_usuarios_index_url
    assert_response :success
  end

end
