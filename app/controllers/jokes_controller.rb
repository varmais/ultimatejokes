class JokesController < ApplicationController

	before_filter :find_joke, except: [:new, :create, :index, :update]


	def index
		@jokes = Joke.all
	end

	def new
		@joke = Joke.new
	end

	def create
		@joke = Joke.new(params[:joke])

		if @joke.save
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
		@joke = Joke.new(params[:joke])

		if @joke.update_attributes(params[:joke])
			redirect_to :joke
		else
			render :edit
		end
	end

	def destroy

		if @joke.destroy
			redirect_to jokes_path
		end
	end

	def find_joke
		@joke = Joke.find(params[:id])
	end
end
