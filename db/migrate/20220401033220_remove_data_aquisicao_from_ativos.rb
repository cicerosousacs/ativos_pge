class RemoveDataAquisicaoFromAtivos < ActiveRecord::Migration[5.2]
  def change
    remove_column :ativos, :data_aquisicao, :date
  end
end
