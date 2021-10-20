class ShopComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  with_options presence: true do
    validates :content
    validates :rate, numericality: {
      less_than_or_equal_to: 5,
      greater_than_or_equal_to: 1
    }
  end

  after_destroy :update_rate_average
  after_save :update_rate_average

  delegate :update_rate_average, to: :shop
end
