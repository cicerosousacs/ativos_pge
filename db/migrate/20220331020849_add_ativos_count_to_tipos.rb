class AddAtivosCountToTipos < ActiveRecord::Migration[5.2]
  def change
    add_column :tipos, :ativos_count, :integer
  end
end
