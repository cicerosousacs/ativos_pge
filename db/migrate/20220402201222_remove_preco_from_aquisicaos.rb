class RemovePrecoFromAquisicaos < ActiveRecord::Migration[5.2]
  def change
    remove_column :aquisicaos, :valor, :decimal
  end
end
