# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
		def signed_in?
			!current_user.nil? 
		end
		
end

