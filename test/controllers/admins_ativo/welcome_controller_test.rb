require 'test_helper'

class AdminsAtivo::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_welcome_index_url
    assert_response :success
  end

end
