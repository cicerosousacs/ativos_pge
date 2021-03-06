class AdminsAtivo::AtivosController < AdminsAtivoController
  before_action :set_ativo, only: [:edit, :update, :destroy]
  before_action :set_tipo_selects, only: [:new, :create, :edit, :update]
  before_action :set_marca_selects, only: [:new, :create, :edit, :update]
  before_action :set_aquisicao_selects, only: [:new, :create, :edit, :update]
  #skip_before_action :verify_authenticity_token # desabilita a proteção CSRF para todo o controller
  protect_from_forgery except: :vincular_deposito # desativa a proteção CSRF apenas para esse metodo

  def index
    if params[:search]
      @ativos = Ativo.ativo_descricao.search(params[:search]).page(params[:page])
    else
      @ativos = Ativo.ultimo_ativo(params[:page])
    end
  end

  def vincular_deposito
    Vinculo.find_or_create_by!(
      area_id: "1",
      subarea_id: "1",
      usuario_id: "1",
      observacao: "Relação de Ativos Disponíveis"
    )

    vincula_ativos = params[:ativos_ids].split(',')
    
    vincula_ativos.each do |ativo|
      Addativo.find_or_create_by!(
        vinculo_id:"1",
        ativo_id: ativo.to_i,
        condicao_id:"1"
      )  
    end
  end

  def new
    @ativo = Ativo.new
  end

  def new_tipo
    respond_to do |format|
      format.html
      format.js { render partial: 'ativos/tipo' }
    end
  end

  def create
    @ativo = Ativo.new(params_ativo)
    if @ativo.save()
      redirect_to admins_ativo_ativos_path, notice: "Ativo cadastrado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ativo.update(params_ativo)
      redirect_to admins_ativo_ativos_path, notice: "Ativo atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @ativo.destroy
      redirect_to admins_ativo_ativos_path, notice: "Ativo excluido. Feito!"
    else
      render :index
    end
  end

  private

  def params_ativo
    params_ativo = params.require(:ativo).permit(:tipo_id, :marca_id, :modelo, :serial, :tombo, 
                                                  :especificacao, :data_aquisicao, :garantia, :aquisicao_id, ativos_ids:[])
  end

  def set_ativo
    @ativo = Ativo.find(params[:id])
  end

  def set_tipo_selects
    @tipo_selects = Tipo.all.pluck(:descricao, :id)
  end

  def set_marca_selects
    @marca_selects = Marca.all.pluck(:nome, :id)
  end

  def set_aquisicao_selects
    @aquisicao_selects = Aquisicao.all.pluck(:numero_contrato, :id)
  end

end
