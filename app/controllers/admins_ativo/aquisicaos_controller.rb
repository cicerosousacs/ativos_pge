class AdminsAtivo::AquisicaosController < AdminsAtivoController
  before_action :set_aquisicao, only: [:edit, :update, :destroy]
  before_action :set_modalidade_selects, only: [:new, :create, :edit, :update]
  before_action :set_origem_selects, only: [:new, :create, :edit, :update]

  def index
    @aquisicaos = Aquisicao.includes(:aquisicao_modalidade, :aquisicao_origem)
  end

  def new
    @aquisicao = Aquisicao.new
  end

  def create
    @aquisicao = Aquisicao.new(params_aquisicao)
    if @aquisicao.save()
      redirect_to admins_ativo_aquisicaos_path, notice: "Aquisição cadastrado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @aquisicao.update(params_aquisicao)
      redirect_to admins_ativo_aquisicaos_path, notice: "Aquisição atualizada. Parabéns!"
    else
      render :edit
    end
  end

  def destroy
    if @aquisicao.destroy
      redirect_to admins_ativo_aquisicaos_path, notice: "Aquisição excluida. Parabéns!"
    else
      render :index
    end
  end

  private

  def params_aquisicao
    params.require(:aquisicao).permit(:item, :quantidade, :valor, :gestor, :data_aquisicao,
                                      :aquisicao_modalidade_id, :numero_contrato, :aquisicao_origem_id, 
                                      :empresa_contratada, :parte_interressada, :anexo_contrato, :anexo_aditivo)
  end

  def set_aquisicao
    @aquisicao = Aquisicao.find(params[:id])
  end

  def set_modalidade_selects
    @modalidade_selects = AquisicaoModalidade.all.pluck(:descricao, :id)
  end

  def set_origem_selects
    @origem_selects = AquisicaoOrigem.all.pluck(:descricao, :id)
  end
  
end
