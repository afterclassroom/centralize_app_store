class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :applications, :dependent => :destroy
  has_one :user_paypal, :dependent => :destroy
  has_one :user_profile, :dependent => :destroy

  after_create :build_profile
  def build_profile
    UserProfile.create(user: self)
  end

  has_attached_file :avatar, {
    :bucket => BUCKET_IMG,
    :default_url => "http://gotoclassroom.com/assets/bg/user.png",
    :styles => { :medium => "300x300>", :thumb => "100x100>" }
  }.merge(PAPERCLIP_STORAGE_OPTIONS)
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def user_name
    if self.user_profile and self.user_profile.name != "" and self.user_profile.name != nil
      self.user_profile.name
    else
      self.email
    end
  end

  def forem_name
    user_name
  end

  def forem_email
    self.email
  end
end
