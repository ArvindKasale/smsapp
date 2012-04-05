class AddCallDuration < ActiveRecord::Migration
  def self.up
  add_column :agent_calls, :duration, :datetime
  end

  def self.down
  end
end
