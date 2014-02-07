class Property < ActiveRecord::Base

	has_many :bookings, :dependent => :destroy
	belongs_to :user
	named_scope :selected_properties, lambda {|prop| }
	has_many :booked_users, :through=> :bookings, :class_name => "User", :source=> :user
	named_scope :country, lambda {|p| {:conditions => ["place like ?", "%#{p}%"]} unless p.blank?}
	named_scope :checkin, lambda {|i| {:conditions => ["ch_in < ?", "#{i}"]} unless i.blank?}
	named_scope :checkout, lambda {|o| {:conditions => ["ch_out > ?", "#{o}"]} unless o.blank?}
	named_scope :guest_count, lambda {|c| {:conditions => ["guestcnt > ?", "#{c}"]} unless c.blank?}


	def check(bcin,bcout,pcin,pcout)
		if (((bcin < pcin) and (pcin< bcout) ) or 
						((bcin < pcout) and (pcout< bcout)) or
						(pcin < bcin and pcout < bcout))
			return true
		end

	end


end
