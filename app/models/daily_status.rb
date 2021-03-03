class DailyStatus < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :ratings
  validates :date, presence: :true
end
