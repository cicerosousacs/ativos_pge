require 'test_helper'

class AdminsAtivo::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_admins_index_url
    assert_response :success
  end

end
