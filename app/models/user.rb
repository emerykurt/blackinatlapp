class User < ApplicationRecord
    has_secure_password
    has_many :ratings
    has_many :eateries, through: :ratings
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
end
