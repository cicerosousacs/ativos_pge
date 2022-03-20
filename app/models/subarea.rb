class Subarea < ApplicationRecord
  belongs_to :area
  has_many :ativos, through: :vinculo
  
  paginates_per 10
end
