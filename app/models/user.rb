class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true

  has_many :rents, dependent: :destroy
  has_many :book_suggestion, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    # rubocop disable: Rails/FindBy
    user = User.find_by(email: data['email'])
    # rubocop enable: Rails/FindBy

    # Uncomment the section below if you want users to be created if they don't exist
    password = Devise.friendly_token[0, 20]
    user ||= User.create(first_name: data['first_name'],
                         email: data['email'],
                         password: password,
                         password_confirmation: password,
                         last_name: data['last_name'],
                         image_url: data['image'])
    user
  end
end
