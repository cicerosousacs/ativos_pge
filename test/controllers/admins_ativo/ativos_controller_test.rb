require 'test_helper'

class AdminsAtivo::AtivosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_ativos_index_url
    assert_response :success
  end

end
