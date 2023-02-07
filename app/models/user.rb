class User < ApplicationRecord
    has_many :items , dependent: :destroy
    validates :email, uniqueness: true
end
