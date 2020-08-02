class User < ApplicationRecord
    has_secure_password
    has_many :ratings, dependent: :destroy
    has_many :eateries, through: :ratings
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
            u.username = auth[:info][:first_name] + auth[:info][:last_name]
            u.first_name = auth[:info][:first_name]
            u.last_name = auth[:info][:last_name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(16)
        end
    end
end
