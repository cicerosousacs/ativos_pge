class Usuario < ApplicationRecord
  paginates_per 10
  has_many :ativos, through: :vinculo

  def check_varios_vinculos
    { true => "Sim", false => "Não" }.fetch(suporte)
  end

end
