require 'test_helper'

class JokeTest < ActiveSupport::TestCase
  
	test "should not save without a title" do
		joke = jokes(:one)
		joke.title = ""
		assert joke.invalid?
		assert !joke.title.nil?
		assert !joke.save
	end

	test "should not save without a content" do
		joke = jokes(:one)
		joke.content = ""
		assert joke.invalid?
		assert !joke.content.nil?
		assert !joke.save
	end



end
