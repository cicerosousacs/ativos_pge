class AdminsAtivo::CondicaosController < AdminsAtivoController
  before_action :set_condicao, only: [:edit, :update, :destroy]

  def index
    @condicoes = Condicao.all
  end

  def new
    @condicao = Condicao.new
  end

  def create
    @condicao = Condicao.new(params_condicao)
      if @condicao.save()
        redirect_to admins_ativo_condicaos_path, notice: "Nova Condição de Ativo criado, Parabéns!"
      else
        render :new
      end
  end

  def edit
  end

  def update
    @condicao.update(params_condicao)
    if redirect_to admins_ativo_condicaos_path, notice: "Condição de Ativo atualizada, Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @condicao.destroy
    if redirect_to admins_ativo_condicaos_path, notice: "Condição de Ativo excluida, Feito!"
    else
      render :index
    end
  end

  private

  def params_condicao
    params.require(:condicao).permit(:descricao)
  end

  def set_condicao
    @condicao = Condicao.find(params[:id])
  end
end
