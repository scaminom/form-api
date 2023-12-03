class AddExtraFieldsToFormsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :forms, :application_number, :serial
    add_column :forms, :date,               :date
    add_column :forms, :address,            :text
    add_column :forms, :justification,      :text
    add_column :forms, :state,              :integer, default: 0
    add_column :forms, :priority_level,     :integer
    add_column :forms, :deadline,           :string
  end
end
