class AddColumnsToShopKeepers < ActiveRecord::Migration
  def self.up
    add_column :shop_keepers, :phone_no_1, :string, :limit=> 10
    add_column :shop_keepers, :phone_no_2, :string, :limit=> 10
    add_column :shop_keepers, :email, :string
    add_column :shop_keepers, :email_2, :string
  end

  def self.down
    remove_column :shop_keepers, :phone_no_1
    remove_column :shop_keepers, :phone_no_2
    remove_column :shop_keepers, :email
    remove_column :shop_keepers, :email_2
  end
end
