class Item < ApplicationRecord
    has_one :stock ,dependent: :destroy
    belongs_to :user ,optional: true

end
