class AddStatusToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :status, :boolean
  end
end
