require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    :activate_authlogic
    @user = users(:one)
    @user2 = users(:two)
    @admin = users(:adminuser)
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
  end

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

  test "Admin should be able to delete other users" do
    UserSession.create(@admin)
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
    assert_redirected_to users_path
  end

  test "Admin should be able to edit other users" do
    UserSession.create(@admin)
    put :update, id: @user, user: @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "Admin should be able to promote other users to admins" do
    UserSession.create(@admin)
    post :promote_to_admin, id: @user.id
    @user = User.find(@user.id);
    assert @user.role == "admin", "@user.role != 'admin', as it should be. It is #{@user.role}"

    assert_redirected_to users_url
  end

  test "Admin should be able demote other users to admins" do
    UserSession.create(@admin)
    @user.role = "admin"
    @user.save
    post :demote_to_user, id: @user.id
    @user = User.find(@user.id);
    assert @user.role.blank?, "@user.role != blank, as it should be, it is #{@user.role}"
    assert_redirected_to users_url
  end

end
