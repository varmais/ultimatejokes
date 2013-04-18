require 'test_helper'

class JokesControllerTest < ActionController::TestCase

	def login_as(user)
		@request.session[:user_id] = user ? user.id : nil
	end

	test "get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:jokes)
	end 


  
end
