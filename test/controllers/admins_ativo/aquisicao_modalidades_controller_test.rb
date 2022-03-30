require 'test_helper'

class AdminsAtivo::AquisicaoModalidadesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_ativo_aquisicao_modalidades_index_url
    assert_response :success
  end

end
