class CreateJoinTableShopKeepers < ActiveRecord::Migration
  def self.up
    create_table 'products_shop_keepers', :id => false do |t|
      t.column :shop_keeper_id, :integer
      t.column :product_id, :integer
    end

  end

  def self.down
    drop_table :products_shop_keepers
  end
end
