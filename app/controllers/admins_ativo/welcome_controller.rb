class AdminsAtivo::WelcomeController < AdminsAtivoController

  def index
    @vinculos = Vinculo.all.order("created_at DESC")
    @tipos = Tipo.all
  end



end
