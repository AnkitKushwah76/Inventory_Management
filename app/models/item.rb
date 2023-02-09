class Item < ApplicationRecord
    has_one_attached :itemImage
    has_one :stock ,dependent: :destroy
    has_many :invoices,dependent: :destroy
    belongs_to :user ,optional: true

    validates :itemName,presence: true

end
