class Addativo < ApplicationRecord
  belongs_to :vinculo
  belongs_to :ativo
  belongs_to :condicao

  # VALIDAÇÔES
  #validates :ativo_id, uniqueness: true


end
