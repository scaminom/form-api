class AcceptRoleUserTableInt < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :role_temp, :integer, default: 0
    User.update_all(role_temp: 0)

    change_column :users, :role_temp, :string
    change_column_default :users, :role_temp, nil

    User.where.not(role_temp: nil).update_all("role_temp = CAST(role_temp AS integer)")

    remove_column :users, :role
    rename_column :users, :role_temp, :role

    change_column :users, :role, :integer, using: 'role::integer', default: 0
  end

  def down
    change_column :users, :role, :string

    add_column :users, :role_temp, :integer, default: 0
    User.update_all(role_temp: 0)

    User.where.not(role: nil).update_all("role_temp = CAST(role AS integer)")

    remove_column :users, :role
    rename_column :users, :role_temp, :role
  end
end

