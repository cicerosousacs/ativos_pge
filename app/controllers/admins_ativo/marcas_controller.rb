class AdminsAtivo::MarcasController < AdminsAtivoController
  before_action :set_marca, only: [:edit, :update, :destroy]

  def index
    @marcas = Marca.all.page(params[:page])
  end

  def new
    @marca = Marca.new
  end

  def create
    @marca = Marca.new(params_marca)
    if @marca.save()
      redirect_to admins_ativo_marcas_path, notice: "marca de Ativo criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @marca.update(params_marca)
      redirect_to admins_ativo_marcas_path, notice: "marca de Ativo atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @marca.destroy
      redirect_to admins_ativo_marcas_path, notice: "marca de Ativo excluido. Feito!"
    else
      render :index
    end
  end

  private

  def params_marca
    params_marca = params.require(:marca).permit(:nome)
  end

  def set_marca
    @marca = Marca.find(params[:id])
  end
end
