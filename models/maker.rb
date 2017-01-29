require 'bcrypt'

class Maker
  attr_accessor :password_confirmation
  attr_reader :password
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true ,unique: true
  property :password_digest, Text
  property :name, String
  property :handle, String, unique: true
  property :logged_in,  Boolean,  :default => false


  validates_confirmation_of :password
  validates_format_of :email, :with => :email_address
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    Maker.first()
  end

  has n, :peeps
end
