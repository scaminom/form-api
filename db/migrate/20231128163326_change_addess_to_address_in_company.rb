class ChangeAddessToAddressInCompany < ActiveRecord::Migration[7.1]
  def change
    rename_column :companies, :addess, :address
  end
end
