class Ativo < ApplicationRecord
  belongs_to :tipo
  belongs_to :marca

  has_one :condicao, through: :vinculo



  # VALIDAÇÔES
  validates :tombo, uniqueness: true
  
  # METODOS
  def ativo_description
    "#{tipo.descricao} #{marca.nome} #{modelo}"
  end


end
