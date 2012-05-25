class AddAddressToDistributor < ActiveRecord::Migration
  def self.up
    add_column :distributors, :address_2, :string
    add_column :distributors, :street, :string
    add_column :distributors, :area, :string
    add_column :distributors, :city, :string
    add_column :distributors, :pincode, :string, :limit=> 6
    add_column :distributors, :district, :string
    add_column :distributors, :state, :string
    add_column :distributors, :contact_person, :string
    rename_column :distributors, :address, :address_1
    rename_column :distributors, :phone_no, :phone_no_1
    add_column :distributors, :phone_no_2, :string, :limit=> 10
    
  end

  def self.down
    remove_column :distributors, :state
    remove_column :distributors, :district
    remove_column :distributors, :pincode
    remove_column :distributors, :city
    remove_column :distributors, :area
    remove_column :distributors, :street
    remove_column :distributors, :address_2
    remove_column :distributors, :phone_no_2
  end
end
