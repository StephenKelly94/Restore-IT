class User < ApplicationRecord

  before_save   { downcase_email }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { minimum: 3, maximum: 100 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX, message: "has invalid format" }
  validates :password, presence: true,
                       length: { minimum: 6, maximum: 100 },
                       allow_nil: true
  has_secure_password
  
  has_many :services


 private
  def downcase_email
    self.email = email.downcase if email.present?
  end
end
