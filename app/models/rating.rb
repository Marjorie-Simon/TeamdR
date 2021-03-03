class Rating < ApplicationRecord
  belongs_to :daily_status, dependent: :destroy
  validates :value_stars, presence: :true
end
