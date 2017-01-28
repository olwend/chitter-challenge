require 'bcrypt'

class Maker
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :name, String
  property :handle, String, unique: true

  attr_accessor :password_confirmation
  attr_reader :password


  validates_confirmation_of :password
  validates_format_of :email, :with => :email_address
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    User.first()
  end

  has n, :peeps
end
