class Joke < ActiveRecord::Base

	attr_accessible :title, :content, :points
	#belongs_to :user
	validates_presence_of :title, :content
end
