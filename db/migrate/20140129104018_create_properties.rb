class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string :place
      t.string :r_name
      t.string :r_type
      t.string :ch_in
      t.string :ch_out
      t.string :price
      t.string :guestcnt

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
