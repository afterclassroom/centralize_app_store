require "securerandom"

class Lm < ActiveRecord::Base
	after_create :generateAccesstoken

	def generateAccesstoken
		self.access_token = SecureRandom.urlsafe_base64
		self.save!
	end
end
