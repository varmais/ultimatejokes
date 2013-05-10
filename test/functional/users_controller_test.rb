require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    :activate_authlogic
    @user = users(:one)
    @user2 = users(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do 
    assert_difference('User.count') do 
      post :create, user: {email: "asd@asd.com", password:
      "asdasd", password_confirmation: "asdasd"}
    end 
    assert_redirected_to user_path(assigns(:user))
  end

 # test "should not create user" do   assert_no_difference('User.count') do     post :create, user:
 # @user.attributes   end

 #   assert_redirected_to user_path(assigns(:user))
 # end
  test "should show user" do
    UserSession.create(users(:one))
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    UserSession.create(users(:one))
    get :edit, id: @user
    assert_response :success
  end

  test "should not get edit for another user" do
    UserSession.create(users(:one))
    get :edit, id: @user2
    assert_redirected_to jokes_path

  test "should update user" do
    UserSession.create(users(:one))
    put :update, id: @user, user: @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should not update another user" do
    UserSession.create(users(:one))
    put :update, id: @user2, user: @user2.attributes
    assert_redirected_to jokes_path
  end


  test "should destroy user" do
    UserSession.create(users(:one))
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should not destroy another user" do
    UserSession.create(users(:one))
    assert_no_difference('User.count') do
      delete :destroy, id: @user2
    end

    assert_redirected_to users_path
  end
end
