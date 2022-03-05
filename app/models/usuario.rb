class Usuario < ApplicationRecord
  paginates_per 10
  has_many :ativos, through: :vinculo
end
