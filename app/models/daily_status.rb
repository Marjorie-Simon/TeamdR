class DailyStatus < ApplicationRecord
  extend SimpleCalendar
  belongs_to :user

  has_many :ratings, dependent: :destroy

  validates :date, presence: :true

  has_calendar :attribute => :date
end
