class AddValorToAquisicaos < ActiveRecord::Migration[5.2]
  def change
    add_column :aquisicaos, :valor, :float
  end
end
