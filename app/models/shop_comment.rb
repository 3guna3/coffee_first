class ShopComment < ApplicationRecord
  with_options presence: true do
    validates :content
    validates :rate
  end
end
