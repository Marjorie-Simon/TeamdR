class Rating < ApplicationRecord
  belongs_to :daily_status
  validates :value_stars, presence: :true, numericality: { only_integer: true, less_than: 6 }
end
