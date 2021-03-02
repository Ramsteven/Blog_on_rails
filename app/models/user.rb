class User < ApplicationRecord
  has_one_attached :avatar
  before_save {self.email = email.downcase}
  has_many :articles, dependent: :destroy 

  validates :username, presence: true, length: {minimum: 3, maximum: 25}, uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: {case_sensitive: false }, format: { with: VALID_EMAIL_REGEX} 
  
  validates :gender, presence: true

  validate :acceptable_image
  has_secure_password
  

  
  def acceptable_image
    return unless avatar.attached?

    unless avatar.byte_size <=1.megabyte
      errors.add(:avatar, "is too big")
    end
    
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end


end
