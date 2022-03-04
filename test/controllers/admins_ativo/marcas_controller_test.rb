require 'test_helper'

class AdminsAtivo::MarcasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_marcas_index_url
    assert_response :success
  end

end
