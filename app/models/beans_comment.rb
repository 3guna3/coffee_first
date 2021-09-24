class BeansComment < ApplicationRecord
  belongs_to :user
  belongs_to :bean

  with_options presence: true do
    validates :content

    with_options numericality: {
      less_than_or_equal_to: 5,
      greater_than_or_equal_to: 1
    } do
      validates :bitterness
      validates :acidity
      validates :body
    end
  end
end
