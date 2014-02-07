class DropColumnFrom < ActiveRecord::Migration
  def self.up
  	remove_column :bookings, :b_place
  end

  def self.down
  	remove_column :bookings, :b_place
  end
end
