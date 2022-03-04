class AdminsAtivo::AdminsController < AdminsAtivoController
  #before_action :verify_password, only: [:update]
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
      if @admin.save()
        redirect_to admins_ativo_admins_path, notice: "Novo Administrador criado. Parabéns!"
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      redirect_to admins_ativo_admins_path, notice: "Administrador atualizado. Sucesso!"
    else
      render :new
    end
  end

  def destroy
    if @admin.destroy
      redirect_to admins_ativo_admins_path, notice: "Administrador removido. Feito!"
    else
      render :index
    end
  end

  private

  def params_admin
    params_admin = params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end


end
