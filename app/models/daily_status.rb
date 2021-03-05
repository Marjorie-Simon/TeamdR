class DailyStatus < ApplicationRecord
  belongs_to :user
  has_many :ratings
  validates :date, presence: :true
end
