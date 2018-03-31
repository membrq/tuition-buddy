class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :requests

  before_save { self.email = email.downcase if email.present? }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  #has_secure_password #add "password digest" column to user model DB via migration

  scope :admin, ->{where(is_admin: true)}
end
