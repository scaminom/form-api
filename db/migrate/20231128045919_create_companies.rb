class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :addess
      t.string :description

      t.timestamps
    end
  end
end
