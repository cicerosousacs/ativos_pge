class AdminsAtivo::WelcomeController < AdminsAtivoController
  def index
    @vinculos = Vinculo.includes(:area, :subarea, :usuario, :addativos)
  end



end
