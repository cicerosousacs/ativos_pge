class AdminsAtivo::SituacaosController < AdminsAtivoController
  before_action :set_situacao, only: [:edit, :update, :destroy]
  before_action :set_condicao_options, only: [:new, :create, :edit, :update]

  def index
    @situacoes = Situacao.all
  end

  def new
    @situacao = Situacao.new
  end

  def create
    @situacao = Situacao.new(params_situacao)
      if @situacao.save()
        redirect_to admins_ativo_situacaos_path, notice: "Nova Condição de Ativo criado, Parabéns!"
      else
        render :new
      end
  end

  def edit
  end

  def update
    @situacao.update(params_situacao)
    if redirect_to admins_ativo_situacaos_path, notice: "Condição de Ativo atualizada, Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @situacao.destroy
    if redirect_to admins_ativo_situacaos_path, notice: "Condição de Ativo excluida, Feito!"
    else
      render :index
    end
  end

  private

  def params_situacao
    params.require(:situacao).permit(:descricao, :condicao_id)
  end

  def set_situacao
    @situacao = Situacao.find(params[:id])
  end

  def set_condicao_options
    @condicao_options = Condicao.all.pluck(:descricao, :id)
  end

end
