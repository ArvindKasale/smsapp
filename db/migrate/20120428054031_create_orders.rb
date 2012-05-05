class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.date :date_placed
      t.date :date_received
      t.integer :company_id
      t.integer :product_id
      t.integer :quantity_placed
      t.integer :quantity_received
      t.integer :balance
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
