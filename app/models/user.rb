class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :daily_statuses
  has_many :ratings, through: :daily_statuses
  has_one_attached :photo
  validates :first_name, presence: :true
  validates :last_name, presence: :true
 # validates :manager, presence: :true
  validates :email, uniqueness: :true
end
