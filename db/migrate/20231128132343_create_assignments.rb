class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true

    end
  end
end
