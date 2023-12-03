class DeleteRoleTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :forms, :requesting
  end
end
