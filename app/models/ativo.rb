class Ativo < ApplicationRecord
  # CONTAGEM DE ATIVOS POR TIPO
  belongs_to :tipo, counter_cache: true
  belongs_to :marca
  belongs_to :aquisicao

  # RELACIONAMENTOS
  has_one :condicao, through: :vinculo

  # PAGINAÇÂO
  paginates_per 10

  # VALIDAÇÔES
  validates :modelo, :serial, :tombo, presence: true
  #validates :tombo, uniqueness: {message: " ja existe. "}
  
  # METODOS

  #descrição do ativo juntando tipo, marca e modelo
  def ativo_description
    #"#{tipo.descricao} #{marca.nome} #{modelo}"
    [self.tipo.descricao, self.marca.nome, self.modelo].join(" ")
  end

  #N+1 de Tipos e Marcas ao Adcionar ativos no vinculo
  def self.ativo_descricao
    Ativo.includes(:tipo, :marca).order("created_at DESC") 
  end

  # N+1 e ordaneção por ultimo criado
  scope :ultimo_ativo, -> (page) {
    includes(:tipo, :marca, :aquisicao).order("created_at DESC").page(page)
  }

  # PESQUISA DE ATIVOS
  scope :search, -> (query) { 
    text = "%#{query}%"
    search_columns = %w[modelo tombo serial]
    where(
      search_columns
        .map { |field| "#{field} LIKE :search" }
        .join(' OR '),
      search: text
    )
  }

end
