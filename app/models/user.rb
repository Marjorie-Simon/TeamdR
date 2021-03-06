class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events,dependent: :destroy
  has_many :daily_statuses, dependent: :destroy
  has_many :ratings, through: :daily_statuses
  has_many :dashboards
  has_many :events_as_invitee, class_name: "Event", foreign_key: :invitee_id
  has_one_attached :photo
  validates :first_name, presence: :true
  validates :last_name, presence: :true
 # validates :manager, presence: :true
  validates :email, uniqueness: :true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def todaysgoal
    self.daily_statuses.find_by(date: Date.today).daily_goal
  end
end
