class MainController < ApplicationController

	def new
		Rails.logger.debug "inside main_controller new"

    	
	end

	def create

   		  Rails.logger.debug "main_controller create"
	      render :show
	end

	def list_properties

		if((params[:search][:country]=="") or (params[:search][:checkin]=="") or (params[:search][:checkout]=="") or (params[:search][:guest_count]=="") )
			flash[:notice] = "Enter All the Fields to continue"
	    	redirect_to new_main_path
			
		else
			@booking= Booking.new
			@search_params = params['search']
			@bval = Hash.new
			@properties = Property.country(params[:search][:country]).checkin(params[:search][:checkin]).checkout(params[:search][:checkout]).guest_count(params[:search][:guest_count])
			@hash = {}
			@properties.each do |prop|
				prop.bookings.each do |booking|
				@hash[prop.id] = false
				pobj = Property.new
				@var = pobj.check(booking.b_cin.to_date,booking.b_cout.to_date,params[:search][:checkin].to_date,params[:search][:checkout].to_date)
					if (@var)
						@hash[prop.id] = true
						break
					end
				  end
				end
			end	
	end

	def show		
	end

	
end
