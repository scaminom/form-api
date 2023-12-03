class AddUserIdToForms < ActiveRecord::Migration[7.1]
  def change
    add_reference :forms, :user, foreign_key: true
  end
end
