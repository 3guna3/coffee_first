class BeansComment < ApplicationRecord
  with_options presence: true do
    validates :content
    validates :bitterness
    validates :acidity
    validates :body
  end
end
