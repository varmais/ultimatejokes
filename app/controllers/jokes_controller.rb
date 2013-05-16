class JokesController < ApplicationController

	#before_filter :find_joke, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_filter :find_joke, only: [:show, :upvote, :downvote]
  	before_filter :require_user, except: [:index, :show]
	before_filter :find_user_joke, only: [:edit, :update, :destroy]
	before_filter :checkforuploadedfile, only: [:update, :create]
	#load_and_authorize_resource
	#skip_authorize_resource only: [:index, :show]

	def index
		@jokes = Joke.all
	end

	def new
		@joke = Joke.new
	end

	def checkforuploadedfile
		if params[:joke] && !params[:joke][:image_data].blank?
			@image_data = params[:joke][:image_data]
			params[:joke][:image_url] = @image_data.original_filename
			params[:joke].delete(:image_data)
		end
  	end

  	def saveuploadedfile
  		if @image_data != nil
  			file_data = @image_data
  			File.open(Rails.root.join('app', 'assets', 'images', file_data.original_filename), 'wb') do |file|
    			file.write(file_data.read)
    		end
    		@image_data = nil
  		end
  	end

	def create
		@joke = Joke.new(params[:joke])
		@joke.user = current_user

		if @joke.save
			saveuploadedfile
			flash[:success] = "Joke saved successfully!"
			redirect_to jokes_path
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @joke.update_attributes(params[:joke])
			saveuploadedfile
			flash[:success] = "Joke updated successfully!"
			redirect_to :joke
		else
			render :edit
		end
	end

	def destroy
		if @joke.destroy
			flash[:success] = "Joke deleted successfully!"
			redirect_to jokes_path
		end
	end

	def upvote
		@joke.liked_by current_user
   		redirect_to @joke
	end

	def downvote
	   	@joke.downvote_from current_user
  	  	redirect_to(@joke)
	end

	def find_joke
		@joke = Joke.find(params[:id])
	end

	def find_user_joke
		@joke = Joke.find(params[:id])
		if @joke.user_id != current_user.id && !current_user_is_admin
			flash[:error] = "Not authorized!"
			redirect_to jokes_path
		end
	end
end
