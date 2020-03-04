class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :create_remember_digest
  has_many :events, foreign_key: :creater_id, class_name: 'Event'
  has_many :attendings, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendings

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.digest(string)
    return nil if string.nil?

    Digest::SHA1.hexdigest string
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  private

  def create_remember_digest
    self.remember_token = User.new_token
    self.remember_digest = User.digest(remember_token)
  end
end
