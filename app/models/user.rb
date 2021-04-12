class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true

  has_many :rents, dependent: :destroy
  has_many :book_suggestion, dependent: :destroy
end
