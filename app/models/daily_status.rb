class DailyStatus < ApplicationRecord
  belongs_to :user
  has_one :rating, dependent: :destroy
  validates :date, presence: :true

  extend SimpleCalendar
  has_calendar :attribute => :date
end
