class CreateShopCategories < ActiveRecord::Migration
  def self.up
    create_table :shop_categories do |t|
      t.string :name
      t.boolean :status, :default=> true

      t.timestamps
    end
  end

  def self.down
    drop_table :shop_categories
  end
end
