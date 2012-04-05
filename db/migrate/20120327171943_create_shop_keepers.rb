class CreateShopKeepers < ActiveRecord::Migration
  def self.up
    create_table :shop_keepers do |t|
      t.string :name
      t.text :address
      t.text :products 
      t.boolean :status, :default => 1	
      t.timestamps
    end
  end

  def self.down
    drop_table :shop_keepers
  end
end
