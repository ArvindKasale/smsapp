class CreateSalesmanDailyReports < ActiveRecord::Migration
  def self.up
    create_table :salesman_daily_reports do |t|
      t.integer :agent_call_id
      t.integer :user_id
      t.integer :shop_keeper_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :sales_cost       
      t.timestamps
    end
  end

  def self.down
    drop_table :salesman_daily_reports
  end
end
