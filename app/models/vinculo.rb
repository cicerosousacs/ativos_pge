class Vinculo < ApplicationRecord
  belongs_to :usuario
  belongs_to :area
  belongs_to :subarea
end
