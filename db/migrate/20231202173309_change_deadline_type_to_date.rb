class ChangeDeadlineTypeToDate < ActiveRecord::Migration[7.1]
  def change
    change_column :forms, :deadline, 'date USING CAST(deadline AS date)'
  end
end
