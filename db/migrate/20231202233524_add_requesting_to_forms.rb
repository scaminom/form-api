class AddRequestingToForms < ActiveRecord::Migration[7.1]
  def change
    add_column :forms, :requesting, :string
  end
end
