class RemoveGarantiaFromAtivos < ActiveRecord::Migration[5.2]
  def change
    remove_column :ativos, :garantia, :boolean
  end
end
