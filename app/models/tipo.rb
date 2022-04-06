class Tipo < ApplicationRecord
  has_many :ativos
  paginates_per 10


end
