class Ativo < ApplicationRecord
  belongs_to :tipo
  belongs_to :marca

  has_one :condicao, through: :vinculo
  has_one :situacao, through: :vinculo
end
