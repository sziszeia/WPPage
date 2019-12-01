class User < ApplicationRecord
    has_one :cart
    validates :userName, presence:true, length: {maximum: 50}, uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password_digest, presence:true, length: {minimum: 8}
end
