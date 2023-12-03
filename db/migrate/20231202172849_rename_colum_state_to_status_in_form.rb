class RenameColumStateToStatusInForm < ActiveRecord::Migration[7.1]
  def change
    rename_column :forms, :state, :status
  end
end
