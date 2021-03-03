class DailyStatus < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_may :ratings
  validates :date, presence: :true
end
