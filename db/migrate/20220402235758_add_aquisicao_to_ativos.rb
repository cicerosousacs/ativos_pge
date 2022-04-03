class AddAquisicaoToAtivos < ActiveRecord::Migration[5.2]
  def change
    add_reference :ativos, :aquisicao, foreign_key: true
  end
end
