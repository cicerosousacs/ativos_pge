require 'test_helper'

class AdminsAtivo::AquisicaosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_aquisicaos_index_url
    assert_response :success
  end

end
