class Aquisicao < ApplicationRecord
  belongs_to :aquisicao_modalidade
  belongs_to :aquisicao_origem

  #has_one_attached :anexo_contrato
  #has_one_attached :anexo_aditivo
end
