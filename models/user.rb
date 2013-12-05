require 'bcrypt'
require 'securerandom'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  include BCrypt
  include Canable::Ables
  include Canable::Cans

  attr_accessor :password

  field :email,        type: String
  field :crypted,      type: String
  field :access_token, type: String

  validates_presence_of :email

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_save :encrypt_password!, :generate_access_token!

  has_many :notes

  def self.authenticate(e, p)
    u = User.where(email: e).first
    u && Password.new(u.crypted) == p ? u : nil
  end

  def viewable_by?(u)
    self == u
  end

  def updatable_by?(u)
    self.viewable_by?(u)
  end

  def destroyable_by?(u)
    self.viewable_by?(u)
  end

  private

  def encrypt_password!
    self.crypted = Password.create(@password)
  end

  def generate_access_token!
    self.access_token = SecureRandom.uuid
  end
end
