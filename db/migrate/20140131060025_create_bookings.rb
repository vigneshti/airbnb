class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.string :b_place
      t.string :b_cin
      t.string :b_cout

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
