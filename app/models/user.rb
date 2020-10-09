class User < ActiveRecord::Base
    has_many :games
    has_secure_password
    validates :username, uniqueness: true
    validates :email, presence: true
end