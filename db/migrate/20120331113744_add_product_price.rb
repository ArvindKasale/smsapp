class AddProductPrice < ActiveRecord::Migration
  def self.up
   create_table :product_prices do |t|
      t.integer :product_id
      t.string :price
   t.timestamps
    end
  end

  def self.down
        drop_table :product_prices
  end
end
