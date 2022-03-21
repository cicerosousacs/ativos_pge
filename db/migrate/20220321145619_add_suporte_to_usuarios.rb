class AddSuporteToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :suporte, :boolean
  end
end
