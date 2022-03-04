class AdminsAtivo::VinculosController < AdminsAtivoController
  before_action :set_vinculo, only: [:edit, :update, :destroy]

  def index
    @vinculos = Vinculo.all
  end

  def new
    @vinculo = Vinculo.new
  end

  def create
    @vinculo = Vinculo.new(params_vinculo)
    if @vinculo.save()
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @vinculo.update(params_vinculo)
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @vinculo.destroy
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo excluido. Sucesso!"
    else
      render :index
    end
  end

  private

  def params_vinculo
    params_vinculo = params.require(:vinculo).permit(:usuario_id, :area_id, :subarea_id, :observacao)
  end

  def set_vinculo
    @vinculo = Vinculo.find(params[:id])
  end


end
