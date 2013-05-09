require 'test_helper'

class UserTest < ActiveSupport::TestCase
    setup do
        :activate_authlogic
        #UserSession.create(users(:one))
    end
    test "should not save user with invalid email" do
        user = users(:one)
        user.email = "asd"
        assert user.invalid?, "User is valid when it should be invalid"
        assert !user.save, "User was saved with an invalid email"
    end
    test "should not save user with too short password" do
        user = users(:one)
        user.password = "asd"
        user.password_confirmation = "asd"
        assert !user.save, "User was saved with password that's too short"
    end
    test "should save user" do
        user = users(:one)
        assert user.valid?, "#{user.errors.messages}"
        assert user.save
    end

    
end
