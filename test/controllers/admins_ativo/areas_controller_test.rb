require 'test_helper'

class AdminsAtivo::AreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_areas_index_url
    assert_response :success
  end

end
