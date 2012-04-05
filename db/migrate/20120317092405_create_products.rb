class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, :limit=>50
      t.text :description
      t.decimal :price
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
