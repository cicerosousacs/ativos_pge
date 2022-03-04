require 'test_helper'

class AdminsAtivo::CondicaosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_condicaos_index_url
    assert_response :success
  end

end
