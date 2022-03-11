class Ativo < ApplicationRecord
  belongs_to :tipo
  belongs_to :marca

  # RELACIONAMENTOS
  has_one :condicao, through: :vinculo

  # PAGINAÇÂO
  paginates_per 10

  # VALIDAÇÔES
  validates :tombo, uniqueness: true
  
  # METODOS
  def ativo_description
    "#{tipo.descricao} #{marca.nome} #{modelo}"
  end

end
