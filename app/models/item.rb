class Item < ApplicationRecord
    has_many_attached :itemImage
    has_one :stock ,dependent: :destroy
    belongs_to :user ,optional: true

end
