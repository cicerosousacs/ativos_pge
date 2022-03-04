class AdminsAtivo::UsuariosController < AdminsAtivoController
  before_action :set_usuario, only: [:edit, :update, :destroy]

  def index
    @usuarios = Usuario.all.page(params[:page])
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params_usuario)
    if @usuario.save()
      redirect_to admins_ativo_usuarios_path, notice: "Usuário criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @usuario.update(params_usuario)
      redirect_to admins_ativo_usuarios_path, notice: "Usuário atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @usuario.destroy
      redirect_to admins_ativo_usuarios_path, notice: "Usuário excluido. Feito!"
    else
      render :index
    end
  end

  private

  def params_usuario
    params_usuario = params.require(:usuario).permit(:nome)
  end

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
