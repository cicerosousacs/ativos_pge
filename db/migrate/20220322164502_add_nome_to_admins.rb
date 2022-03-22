class AddNomeToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :nome, :string
  end
end
