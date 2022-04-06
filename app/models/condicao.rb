class Condicao < ApplicationRecord
    has_many :ativo, through: :vinculo
end
