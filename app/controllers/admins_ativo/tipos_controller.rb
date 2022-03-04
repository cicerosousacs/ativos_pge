class AdminsAtivo::TiposController < AdminsAtivoController
  before_action :set_tipo, only: [:edit, :update, :destroy]

  def index
    @tipos = Tipo.all.page(params[:page])
  end

  def new
    @tipo = Tipo.new
  end

  def create
    @tipo = Tipo.new(params_tipo)
    if @tipo.save()
      redirect_to admins_ativo_tipos_path, notice: "Tipo de Ativo criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tipo.update(params_tipo)
      redirect_to admins_ativo_tipos_path, notice: "Tipo de Ativo atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @tipo.destroy
      redirect_to admins_ativo_tipos_path, notice: "Tipo de Ativo excluido. Feito!"
    else
      render :index
    end
  end

  private

  def params_tipo
    params_tipo = params.require(:tipo).permit(:descricao)
  end

  def set_tipo
    @tipo = Tipo.find(params[:id])
  end

end
