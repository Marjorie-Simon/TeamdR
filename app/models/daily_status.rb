class DailyStatus < ApplicationRecord
  belongs_to :user
  has_may :ratings
  validates :date, presence: :true
end
