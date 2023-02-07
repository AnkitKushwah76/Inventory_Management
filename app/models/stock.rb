class Stock < ApplicationRecord
    belongs_to :item ,optional: true
    
end
