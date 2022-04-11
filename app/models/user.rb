class User < ApplicationRecord
    has_secure_password
    has_many :scorecards
    has_many :bags
    has_many :discs, through: :bags


    # validates: :username, :first_name, :last_name, :email, presence: true
    # validates: :username, :email, uniqueness: true
end
