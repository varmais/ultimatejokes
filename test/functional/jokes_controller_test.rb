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

	def login_as(user)
		@request.session[:user_id] = user ? user.id : nil
	end

	#these should only work when logged in
	test "should get new joke page" do
		login_as(users(:one))
		get :new
		assert_response :success
	end

	test "should create new joke" do
		login_as(users(:one))
		assert_difference('Joke.count') do
			post :create, joke: 
			{title: jokes(:one).title, content: jokes(:one).content}
		end
		assert_redirected_to jokes_path
	end

	test "should get edit joke page" do
		login_as(users(:one))
		get :edit, id: jokes(:one).id
		assert_response :success
	end

	test "should update joke" do
		login_as(users(:one))
		put :update, id: jokes(:one).id, joke: 
		{title: 'jooh jooh jooh'}
		assert_response :redirect
		assert_redirected_to :joke
	end

	test "should not update invalid joke" do
		login_as(users(:one))
		put :update, id: jokes(:one), joke: {title: '' }
		assert_template :edit
	end

	test "should delete joke" do
		login_as(users(:one))
		assert_difference('Joke.count', -1) do
			delete :destroy, id: jokes(:one).id
		end
		assert_redirected_to jokes_path
	end

#	test "should not edit other's joke" do
#		login_as(users(:one))
#		get :edit, id: jokes(:two).id
#		assert_redirected_to :joke
#	end

#	test "should not delete other's joke" do
#		login_as(users(:one))
#		assert_difference('Joke.count', -1) do
#			delete :destroy, id: jokes(:two).id
#		end
#		assert_response :redirect
#		assert_redirected_to :joke
#	end

end
