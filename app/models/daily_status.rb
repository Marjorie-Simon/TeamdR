class DailyStatus < ApplicationRecord
  belongs_to :user
  has_one :rating
  validates :date, presence: :true

  extend SimpleCalendar
  has_calendar :attribute => :date
end
