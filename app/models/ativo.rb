class Ativo < ApplicationRecord
  belongs_to :tipo
  belongs_to :marca

  # RELACIONAMENTOS
  has_one :condicao, through: :vinculo

  # PAGINAÇÂO
  paginates_per 10

  # VALIDAÇÔES
  validates :modelo, :serial, :tombo, presence: true
  validates :tombo, uniqueness: true
  
  # METODOS

  #descrição do ativo juntando tipo, marca e modelo
  def ativo_description
    "#{tipo.descricao} #{marca.nome} #{modelo}"
  end

  #N+1 de Tipos e Marcas ao Adcionar ativos no vinculo
  def self.ativo_descricao
    Ativo.includes(:tipo, :marca) 
  end

  # N+1 e ordaneção por ultimo criado
  scope :ultimo_ativo, -> (page) {
    includes(:tipo, :marca).order("created_at DESC").page(page)
  }
  # Pesquisa e paginação - SearchController
  scope :_search_, -> (page, term) {
    includes(:tipo, :marca).where("lower(description) LIKE ?", "%#{term.downcase}%").page(page)
  }

end
