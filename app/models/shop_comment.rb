class ShopComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :content, presence: true
  validates :rate, presence: true
end
