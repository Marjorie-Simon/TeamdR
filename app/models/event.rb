class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :invitee, class_name: "User"
  validates :title, presence: :true
  validates :start_time, presence: :true
  validates :end_time, presence: :true

end
