class Joke < ActiveRecord::Base
	acts_as_votable
	attr_accessible :title, :content, :user_id
	belongs_to :user
	validates_presence_of :title, :content
end
