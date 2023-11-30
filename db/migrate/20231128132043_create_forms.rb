class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.string :title
      t.string :objective
      t.string :description

    end
  end
end
