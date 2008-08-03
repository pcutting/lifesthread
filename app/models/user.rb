#  create_table "users", :force => true do |t|
#    t.string   "login"
#    t.string   "first_name"
#    t.string   "middle_name"
#    t.string   "last_name"
#    t.string   "sir_name"
#    t.string   "email"
#    t.string   "crypted_password",          :limit => 40
#    t.string   "salt",                      :limit => 40
#    t.datetime "created_at"
#    t.datetime "updated_at"
#    t.string   "remember_token"
#    t.datetime "remember_token_expires_at"
#    t.boolean  "admin",                                   :default => false
#    t.boolean  "public",                                  :default => false
#    t.string   "time_zone",                               :default => "Eastern"
#  end


require 'digest/sha1'
class User < ActiveRecord::Base

has_one :profile

has_many :opinions
has_many :workouts
has_many :fitness_plans
has_many :medications
has_many :bps
has_many :cholesterols
has_many :stresses
has_many :stress_logs, :through => :stresses
has_many :relationships
has_many :journals, :through=> :relationships
has_many :foods
has_many :medical_histories
has_many :illness_histories
has_many :measurements
has_many :supports
has_many :support_dialogs, :through => :supports
has_many :sleeps
has_many :permissions
has_many :roles


  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :login, :email, :time_zone, :first_name, :last_name
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save :encrypt_password
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :password, :password_confirmation, :time_zone, :first_name, :last_name,  :middle_name  #, :admin
  
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
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
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end
  
  #---------------------------

  def full_name
    fullName = self.first_name + " "
    fullName += self.middle_name + " " unless self.middle_name.nil?
    fullName += self.last_name
    
  end

  protected #----------------------
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    
end
