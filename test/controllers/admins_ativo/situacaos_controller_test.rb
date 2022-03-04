require 'test_helper'

class AdminsAtivo::SituacaosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_situacaos_index_url
    assert_response :success
  end

end
