require 'test_helper'

class UserTest < ActiveSupport::TestCase
    setup do
        :activate_authlogic
        #UserSession.create(users(:one))
    end
    test "should not save user with invalid email" do
        user = users(:one)
        user.email = "asd"
        assert user.invalid?
        assert !user.save
    end

    test "should save user" do
        user = users(:one)
        assert user.save
    end

    test "should not save user with too short password" do
        user = users(:one)
        user.password = "asd"
        user.password_confirmation = "asd"
        assert !user.save
    end
end
