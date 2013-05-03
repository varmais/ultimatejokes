class JokesController < ApplicationController

	before_filter :find_joke, only: [:show]
  	#before_filter :require_user, except: [:index, :show]
	#before_filter :find_user_joke, only: [:edit, :update, :destroy]

	def index
		@jokes = Joke.all
	end

	def new
		@joke = Joke.new
	end

	def create
		@joke = Joke.new(params[:joke])
		@joke.user = current_user

		if @joke.save
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
			flash[:success] = "Joke updated successfully!"
			redirect_to :joke
		else
			render :edit
		end
	end

	def destroy
		if @joke.destroy
			flash[:sucess] = "Joke deleted successfully!"
			redirect_to jokes_path
		end
	end

	def upvote
		current_user.upvotes @joke
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
		@joke = current_user.jokes.find(params[:id])
	end
end
