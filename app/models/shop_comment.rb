class ShopComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  with_options presence: true do
    validates :content
    validates :rate
  end
end
