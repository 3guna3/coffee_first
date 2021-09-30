class ShopComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :content, presence: true
  validates :rate, presence: true

  after_save :update_rate_average
  after_destroy :update_rate_average

  delegate :update_rate_average, to: :shop
end
