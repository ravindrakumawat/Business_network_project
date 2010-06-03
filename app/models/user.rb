require 'digest/sha1'
class User < ActiveRecord::Base

  has_many :friendships
  has_many :friends,
           :through => :friendships,
           :conditions => "status = 'accepted'",
           :order => :login

  has_many :requested_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'requested'"
           

  has_many :pending_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'pending'"
          
  has_many :videos
  has_many :albums
  has_one  :spec
  has_one  :blog
  has_one  :company
  has_one  :photo
  has_one  :education
  has_many :group_join
  has_one  :online
  has_many :groups
  has_many :sounds
  has_one  :user_status
  attr_accessor :password
  validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false

 validates_format_of :login,
:with => /^[A-Z0-9_]*$/i,
:message => "must contain only letters, " +
"numbers, and underscores"
validates_format_of :email,
:with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
:message => "must be a valid email address"
  
  before_save :encrypt_password
  before_create :make_activation_code
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find :first,:conditions =>['login =? and activated_at IS NOT NULL', login]
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    self.remember_token_expires_at = 2.weeks.from_now.utc
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

 def make_activation_code
 self.activation_code = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)
 end
 def activate
 @activated =true
 update_attributes(:activated_at => Time.now.utc,:activation_code=> nil)
 end
 def recently_activated?
   @activated
 end

 def create_reset_code
    @reset = true
    self.attributes = {:reset_code => Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )}
    save(false)
  end

  def recently_reset?
    @reset
  end

  def delete_reset_code
    self.attributes = {:reset_code => nil}
    save(false)
  end
   def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end

    def password_required?
      crypted_password.blank? || !password.blank?
    end
 def name
    user.login
 end

end
