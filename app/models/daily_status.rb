class DailyStatus < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :date, presence: :true
  validates :title, uniqueness: { scope: :date,
    message: "you can only have one status for a given day" }

  extend SimpleCalendar
  has_calendar :attribute => :date
end
