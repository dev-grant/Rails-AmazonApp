require 'uri'
class Link < ActiveRecord::Base
	acts_as_votable
	validates_presence_of :title
	validates_presence_of :url
	validates_format_of :url, :with => /\A(http[s]?:\/\/)?www.amazon.com\/([\w-]+\/)?(dp|gp\/product)\/(\w+)?(\w{10})(.*)\Z/ix
	belongs_to :user
	has_many :comments



	def create_referral_link
		asin = url.match(/\/(dp|gp\/product)\/([^\/]*)/)
		self.url = "http://www.amazon.com/dp/#{asin[2]}" # put referal id HERE
	end
end
