require "securerandom"

class Lm < ActiveRecord::Base
	after_create :generateAccesstoken

	belongs_to :user

	self.per_page = 10

	Paperclip
	has_attached_file :brand, {
	  :bucket => BUCKET_IMG,
	  :default_url => "http://gotoclassroom.com/assets/brand/no_img.png",
	  :styles => { :medium => "300x300>", :thumb => "100x100>" }
	}.merge(PAPERCLIP_STORAGE_OPTIONS)
	validates_attachment_content_type :brand, :content_type => /\Aimage\/.*\Z/

	def generateAccesstoken
		self.access_token = SecureRandom.urlsafe_base64
		self.save!
	end
end
