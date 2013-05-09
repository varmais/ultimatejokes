class StaticPagesController < ApplicationController

	def home
        if current_user
            redirect_to jokes_path
        end
	end
end
