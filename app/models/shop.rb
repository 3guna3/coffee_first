class Shop < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :prefacture
    validates :address
  end
end
