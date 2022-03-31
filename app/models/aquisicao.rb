class Aquisicao < ApplicationRecord
  belongs_to :modalidade
  belongs_to :origem

  has_one_attached :anexo_contrato
  has_one_attached :anexo_aditivo
end
