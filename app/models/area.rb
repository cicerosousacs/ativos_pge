class Area < ApplicationRecord
  has_many :ativos, through: :vinculo
  
  paginates_per 10
end
