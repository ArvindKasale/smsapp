class AddDateToProductPrice < ActiveRecord::Migration
  def self.up
    add_column :product_prices, :date, :date
  end

  def self.down
    remove_column :product_prices, :date
  end
end
