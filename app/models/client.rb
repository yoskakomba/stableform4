class Client < ActiveRecord::Base
  has_many :enrollments
  before_save { self.email = email.downcase }
  validates :clientname, presence: true, length: { minimum: 4, maximum: 40 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
end