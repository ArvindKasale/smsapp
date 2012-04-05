class CreateSaleItems < ActiveRecord::Migration
  def self.up
    create_table :sale_items do |t|
      t.integer :user_id
      t.date :sale_date
      t.integer :product_id
      t.integer :quantity
      t.decimal :total_cost
      t.timestamps
    end
  end

  def self.down
    drop_table :sale_items
  end
end
