class RemoveFieldsFromForms < ActiveRecord::Migration[7.1]
  def change
    remove_column :forms, :objective
  end
end
