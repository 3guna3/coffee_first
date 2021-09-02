class Bean < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price
    validates :country
  end
end
