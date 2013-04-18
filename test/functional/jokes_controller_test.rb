require 'test_helper'

class JokesControllerTest < ActionController::TestCase

	test "get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:jokes)
	end 

	test "should get show" do
		get :show, id: jokes(:one).id
		assert_response :success
	end
  
end
