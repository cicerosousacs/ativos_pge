class Addativo < ApplicationRecord
  belongs_to :vinculo
  belongs_to :ativo
  belongs_to :condicao

  #VALIDAÇÔES
  
  validates :ativo_id, uniqueness: true, unless: :vinculo_existe?
  
  def vinculo_existe?
    if condicao_id == "1"
    end
  end


end
