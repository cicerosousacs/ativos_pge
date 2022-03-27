class AdminsAtivo::VinculosController < AdminsAtivoController
  before_action :set_vinculo, only: [:edit, :update, :destroy]
  before_action :set_usuario_select, only: [:new, :create, :edit, :update]
  before_action :set_area_select, only: [:new, :create, :edit, :update]
  before_action :set_subarea_select, only: [:new, :create, :edit, :update]
  before_action :set_ativo_select, only: [:new, :create, :edit, :update]
  before_action :set_condicao_select, only: [:new, :create, :edit, :update]


  def index
    @vinculos = Vinculo.includes(:usuario, :area, :subarea).order("created_at DESC")
  end

  def new
    @vinculo = Vinculo.new
  end

  def create
    @vinculo = Vinculo.new(params_vinculo)
    if @vinculo.save()
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo criado, Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @vinculo.update(params_vinculo)
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo atualizado, Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @vinculo.destroy
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo excluido, Sucesso!"
    else
      render :index
    end
  end

  private

  def params_vinculo
    params_vinculo = params.require(:vinculo).permit(
      :usuario_id, 
      :area_id, 
      :subarea_id, 
      :observacao,
      addativos_attributes: [:id, :ativo_id, :descricao, :condicao_id, :_destroy])
  end

  def set_vinculo
    @vinculo = Vinculo.find(params[:id])
  end

  def set_usuario_select
    @usuario_select = Usuario.all.pluck(:nome, :id)
  end

  def set_area_select
    @area_select = Area.all.pluck(:descricao, :id)
  end

  def set_subarea_select
    @subarea_select = Subarea.all.pluck(:descricao, :id)
  end

  def set_ativo_select
    @ativo_select = Ativo.all.pluck(:tombo, :id)
  end

  def set_condicao_select
    @condicao_select = Condicao.all.pluck(:descricao, :id)
  end

end