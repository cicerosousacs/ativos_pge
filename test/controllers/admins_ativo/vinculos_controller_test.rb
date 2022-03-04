require 'test_helper'

class AdminsAtivo::VinculosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_vinculos_index_url
    assert_response :success
  end

end
