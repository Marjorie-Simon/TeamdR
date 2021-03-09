class DailyStatus < ApplicationRecord
  extend SimpleCalendar
  belongs_to :user
  has_one :rating, dependent: :destroy
  validates :date, presence: :true
  validates :title, uniqueness: { scope: :date,
    message: "you can only have one status for a given day" }

  has_calendar :attribute => :date
end
