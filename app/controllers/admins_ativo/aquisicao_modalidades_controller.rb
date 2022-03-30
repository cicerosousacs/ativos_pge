class AdminsAtivo::AquisicaoModalidadesController < AdminsAtivoController
  before_action :set_aquisicao_modalidade, only: [:edit, :update, :destroy]

  def index
    @aquisicao_modalidades = AquisicaoModalidade.all
  end

  def new
    @aquisicao_modalidade = AquisicaoModalidade.new
  end

  def create
    @aquisicao_modalidade = AquisicaoModalidade.new(params_aquisicao_modalidade)
    if @aquisicao_modalidade.save()
      redirect_to admins_ativo_aquisicao_modalidades_path, notice: "Modalidade criada, Parabéns!"
    else
      render :new
    end
  end
 
  def edit
  end

  def update
    if @aquisicao_modalidade.update(params_aquisicao_modalidade)
      redirect_to admins_ativo_aquisicao_modalidades_path, notice: "Modalidade alterada, Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @aquisicao_modalidade.destroy
      redirect_to admins_ativo_aquisicao_modalidades_path, notice: "Modalidade excluida, Feito!"
    else
      render :index
    end
  end

  private

  def params_aquisicao_modalidade
    params_aquisicao_modalidade = params.require(:aquisicao_modalidade).permit(:descricao)
  end

  def set_aquisicao_modalidade
    @aquisicao_modalidade = AquisicaoModalidade.find(params[:id])
  end

end
