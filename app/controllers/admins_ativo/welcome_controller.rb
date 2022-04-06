class AdminsAtivo::WelcomeController < AdminsAtivoController

  def index
    @vinculos = Vinculo.all.order("created_at DESC")
    @tipos = Tipo.all
    @total_ativos = Tipo.sum(:ativos_count)
    @total_vinculos = Vinculo.count(:id)
  end

end
