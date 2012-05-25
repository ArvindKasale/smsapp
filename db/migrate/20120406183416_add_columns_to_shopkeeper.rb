class AddColumnsToShopkeeper < ActiveRecord::Migration
  def self.up
    add_column :shop_keepers, :contact_person, :string
    add_column :shop_keepers, :address_2, :string
    add_column :shop_keepers, :street, :string
    add_column :shop_keepers, :area, :string
    add_column :shop_keepers, :city, :string
    add_column :shop_keepers, :pincode, :string, :limit=> 6
    add_column :shop_keepers, :district, :string
    add_column :shop_keepers, :state, :string
    add_column :shop_keepers, :shop_category_id, :integer
    rename_column :shop_keepers, :address, :address_1
  end

  def self.down
    remove_column :shop_keepers, :shop_category_id
    remove_column :shop_keepers, :state
    remove_column :shop_keepers, :district
    remove_column :shop_keepers, :pincode
    remove_column :shop_keepers, :city
    remove_column :shop_keepers, :area
    remove_column :shop_keepers, :street
    remove_column :shop_keepers, :address_2
    remove_column :shop_keepers, :contact_person
    
  end
end
