require 'SecureRandom'

class User < ActiveRecord::Base
 #attr_accessible :email#, :password, :password_confirmation
  has_many :courses, dependent: :destroy
  
  attr_accessor :password
  before_save :encrypt_password, :reset_auth_token
  before_create :setup


  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email  

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def reset_auth_token
    self.auth_token = SecureRandom.urlsafe_base64(nil,false)
  end

  def setup
    self.login_attempts = 0;
    self.email_needs_validated = true
    self.locked = false
    self.password_needs_reset = false
    reset_auth_token
  end
end
