class AdminsAtivo::AquisicaosController < AdminsAtivoController

  def index
    @aquisicaos = Aquisicao.all
  end

  def new
    @aquisicao = Aquisicao.new
  end
  
end
