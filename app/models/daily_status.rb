class DailyStatus < ApplicationRecord
 # extend SimpleCalendar
  belongs_to :user

  has_one :rating #dependent: :destroy

  validates :date, presence: :true
end
