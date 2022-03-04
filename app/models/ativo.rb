class Ativo < ApplicationRecord
  belongs_to :tipo
  belongs_to :marca
end
