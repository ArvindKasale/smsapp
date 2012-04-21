class CreateJoinTable < ActiveRecord::Migration
  def self.up
    create_table 'companies_products', :id => false do |t|
      t.column :company_id, :integer
      t.column :product_id, :integer
    end

  end

  def self.down
    drop_table :companies_product
  end
end
