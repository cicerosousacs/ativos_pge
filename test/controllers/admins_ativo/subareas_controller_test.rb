require 'test_helper'

class AdminsAtivo::SubareasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_subareas_index_url
    assert_response :success
  end

end
