class Rating < ApplicationRecord
  belongs_to :daily_status
  validates :value_stars, presence: :true
end
