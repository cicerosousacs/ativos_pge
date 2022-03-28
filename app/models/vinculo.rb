class Vinculo < ApplicationRecord
  # RELACIONAMENTOS
  belongs_to :usuario
  belongs_to :area
  belongs_to :subarea

  has_many :addativos, dependent: :destroy
  accepts_nested_attributes_for :addativos, reject_if: :all_blank, allow_destroy: true

  # VALIDAÇÔES
  #validates :addativos, presence: true
  validates :addativos, :presence => { :message => "É necessario incluir ao menos um Ativo!"}
  
  validates :usuario_id, uniqueness: true, unless: -> { usuario.suporte == true }
  # Outra forma de fazer a validação 
  #validates :usuario_id, uniqueness: true,
  #  unless: Proc.new { |u| u.usuario.suporte == true }

  

  def vinculo_descricao
    #"#{area.descricao} - #{subarea.descricao} - #{usuario.nome}" 
    [self.area.descricao, self.subarea.descricao, self.usuario.nome, self.observacao].join(" - ")
  end

end
