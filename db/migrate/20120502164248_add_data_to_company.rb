class AddDataToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :address, :text
    add_column :companies, :street, :string
    add_column :companies, :area, :string
    add_column :companies, :city, :string
    add_column :companies, :pincode, :string, :limit=> 6
    add_column :companies, :district, :string
    add_column :companies, :state, :string
    add_column :companies, :fax, :string
    add_column :companies, :website, :string
    add_column :companies, :phone_number_2, :string, :limit=> 10
  end

  def self.down
    remove_column :companies, :address
    remove_column :companies, :street
    remove_column :companies, :area
    remove_column :companies, :city
    remove_column :companies, :pincode
    remove_column :companies, :district
    remove_column :companies, :state
    remove_column :companies, :fax
    remove_column :companies, :website
    remove_column :companies, :phone_number_2
  end
end
