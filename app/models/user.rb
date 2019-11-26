class User < ApplicationRecord
    has_one :cart
    validates :userName, :password, presence:true
end
