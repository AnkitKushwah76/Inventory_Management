class User < ApplicationRecord
    has_many :items
    validates :email, uniqueness: true
end
