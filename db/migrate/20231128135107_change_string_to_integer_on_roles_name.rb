class ChangeStringToIntegerOnRolesName < ActiveRecord::Migration[7.1]
  def change
    change_column :roles, :name, :integer, using: 'name::integer'
  end
end
