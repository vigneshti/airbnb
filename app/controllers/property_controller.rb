class PropertyController < ApplicationController

	def new
	  	Rails.logger.debug "inside property controller new"
	    @property = Property.new
    end

	def create
		 @property=current_user.properties.build(params[:property])
   		
	    if( (params[:property][:place]=="") or (params[:property][:r_name]=="") or (params[:property][:r_type]=="") or (params[:property][:ch_in]=="") or (params[:property][:ch_out]=="") or (params[:property][:price]=="") or (params[:property][:guestcnt]==""))
	    	flash[:notice] = "Enter All the Fields to continue"
	    	render :action => :new
	    else
	    	 if @property.save
		  		redirect_to new_main_path
		    else
		      render :action => :new
		    end
	    end   
	end

	def show
		
	end
end
