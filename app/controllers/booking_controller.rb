class BookingController < ApplicationController
	
	def new
	    @booking = Booking.new
    end

	def create
   		prop = Property.find(params[:prop_id]) 
	   	@booking = current_user.bookings.build(:b_cin => params[:booking][:b_cin], :b_cout=> params[:booking][:b_cout],:property_id=> prop[:id])
	    if @booking.save
	      	render :action => :show
	    else
	      
	        render :action => :new
	    end
	end

	def show
		
	end

end
