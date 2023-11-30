class AddJwtToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :jwt, :string
    add_index :users, :jwt
  end
end
