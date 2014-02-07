class ChangesInBookingTable < ActiveRecord::Migration
  def self.up
  	add_column :bookings, :property_id, :integer
  end

  def self.down
  	remove_column :bookings, :property_id
  end
end
