class CreateAgentCalls < ActiveRecord::Migration
  def self.up
    create_table :agent_calls do |t|
   	 t.integer :user_id
      t.integer :shop_id
      t.boolean :attending, :default => 1  
	 t.integer :message
      t.timestamps
    end
  end

  def self.down
    drop_table :agent_calls
  end
end
