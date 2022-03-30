require 'test_helper'

class AdminsAtivo::AquisicaoOrigemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_aquisicao_origems_index_url
    assert_response :success
  end

end
