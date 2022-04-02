class Aquisicao < ApplicationRecord
  belongs_to :aquisicao_modalidade
  belongs_to :aquisicao_origem

  has_one_attached :anexo_contrato
  has_one_attached :anexo_aditivo

  validate :check_pdf_aditivo, :check_pdf_contrato

  require 'money'

  private

  def check_pdf_aditivo
    if anexo_aditivo.attached? && !anexo_aditivo.content_type.in?(%w(application/pdf))
      anexo_aditivo.purge
      errors.add(:anexo_aditivo, '- apenas arquivos PDF são permitidos.')
    end
  end

  def check_pdf_contrato
    if anexo_contrato.attached? && !anexo_contrato.content_type.in?(%w(application/pdf))
      anexo_contrato.purge
      errors.add(:anexo_contrato, '- apenas arquivos PDF são permitidos.')
    end
  end

end
