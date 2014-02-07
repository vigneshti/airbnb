class User < ActiveRecord::Base
	has_many :property, :dependent => :destroy
	has_many :properties, :dependent => :destroy
	has_many :bookings, :dependent => :destroy
	has_many :booked_properties, :through=>:bookings , :class_name=>"Property", :source=>:property
	acts_as_authentic do |c|
		c.login_field = 'email'
	end
end
