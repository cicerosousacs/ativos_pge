class AdminsAtivo::AquisicaoOrigemsController < AdminsAtivoController
  before_action :set_aquisicao_origem, only: [:edit, :update, :destroy]

  def index
    @aquisicao_origems = AquisicaoOrigem.all
  end

  def new
    @aquisicao_origem = AquisicaoOrigem.new
  end

  def create
    @aquisicao_origem = AquisicaoOrigem.new(params_aquisicao_origem)
    if @aquisicao_origem.save()
      redirect_to admins_ativo_aquisicao_origems_path, notice: "Origem criada, Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update   
    if @aquisicao_origem.update(params_aquisicao_origem)
      redirect_to admins_ativo_aquisicao_origems_path, notice: "Origem atualizada, Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @aquisicao_origem.destroy
      redirect_to admins_ativo_aquisicao_origems_path, notice: "Origem excluida, Feito!"
    else
      render :index
    end
  end

  private

  def params_aquisicao_origem
    params.require(:aquisicao_origem).permit(:descricao)
  end

  def set_aquisicao_origem
    @aquisicao_origem = AquisicaoOrigem.find(params[:id])
  end
  
end
