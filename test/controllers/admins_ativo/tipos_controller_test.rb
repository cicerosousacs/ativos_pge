require 'test_helper'

class AdminsAtivo::TiposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_tipos_index_url
    assert_response :success
  end

end
