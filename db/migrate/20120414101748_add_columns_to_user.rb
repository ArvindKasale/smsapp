class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :address_2, :string
    add_column :users, :street, :string
    add_column :users, :area, :string
    add_column :users, :city, :string
    add_column :users, :pincode, :string
    add_column :users, :district, :string
    add_column :users, :state, :string
    rename_column :users, :address, :address_1
    rename_column :users, :phone_no, :phone_no_1
    add_column :users, :phone_no_2, :string
    add_column :users, :emergency_name, :string
    add_column :users, :emergency_no, :string
  end

  def self.down
    remove_column :users, :state
    remove_column :users, :district
    remove_column :users, :pincode
    remove_column :users, :city
    remove_column :users, :area
    remove_column :users, :street
    remove_column :users, :address_2
    remove_column :users, :emergency_name
    remove_column :users, :emergency_no
    remove_column :users, :phone_no_2
  end
end
