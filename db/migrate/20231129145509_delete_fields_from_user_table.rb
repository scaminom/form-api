class DeleteFieldsFromUserTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :remember_created_at, :datetime
    remove_column :users, :authentication_token, :string
    remove_column :users, :jwt, :string
  end
end
