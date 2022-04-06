class Aquisicao < ApplicationRecord
  belongs_to :aquisicao_modalidade
  belongs_to :aquisicao_origem
  
  has_many :ativos

  has_one_attached :anexo_contrato
  has_one_attached :anexo_aditivo
  #VALIDAÇÕES DA GEM gem 'active_storage_validations'
  validates :anexo_contrato, attached: true, content_type: { in: 'application/pdf', message: '- apenas arquivos em PDF' }
  validates :anexo_aditivo, content_type: 'application/pdf'
  
  require 'money'

  private
  #METODO NATIVO DO ACTIVE STORAGE
  #validate :check_pdf_aditivo, :check_pdf_contrato

  #def check_pdf_aditivo
  #  if anexo_aditivo.attached? && !anexo_aditivo.content_type.in?(%w(application/pdf))
  #    anexo_aditivo.purge
  #    errors.add(:anexo_aditivo, '- apenas arquivos PDF são permitidos.')
  #  end
  #end

  #def check_pdf_contrato
  #  if anexo_contrato.attached? && !anexo_contrato.content_type.in?(%w(application/pdf))
  #    anexo_contrato.purge
  #    errors.add(:anexo_contrato, '- apenas arquivos PDF são permitidos.')
  #  end
  #end

end
