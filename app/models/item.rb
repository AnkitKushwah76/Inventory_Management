class Item < ApplicationRecord
    has_one_attached :item_image
    has_one :stock ,dependent: :destroy
    has_many :invoices,dependent: :destroy
    belongs_to :user ,optional: true

    # validates :item_name,presence: true
    # validates :item_price,numericality: {greater_than_or_equal_to: 1}

    def self.to_csv
        attributes = %w{id item_name item_price item_quatity}
        CSV.generate(headers: true) do |csv|
          csv << attributes
          all.find_each do |user|
          csv << attributes.map{ |attr| user.send(attr) }
          end
        end
    end

end
