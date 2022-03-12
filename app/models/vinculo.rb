class Vinculo < ApplicationRecord
  belongs_to :usuario#, optional: true
  belongs_to :area
  belongs_to :subarea

  has_many :addativos, dependent: :destroy
  accepts_nested_attributes_for :addativos, reject_if: :all_blank, allow_destroy: true

  
  # VALIDAÇÔES
  validates_associated :addativos, uniqueness: true 

end
