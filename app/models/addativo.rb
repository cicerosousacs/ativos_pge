class Addativo < ApplicationRecord
  belongs_to :vinculo
  belongs_to :ativo
  belongs_to :condicao

  #def ativo_descricao
  #  if self.ativo.blank?
  #    " --- "
  #  else
  #    self.ativo.modelo
  #  end
  #end

  
end
