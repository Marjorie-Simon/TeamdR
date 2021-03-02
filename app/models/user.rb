class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, :daily_statuses
  has_many :ratings, through: :daily_statuses
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :manager, presence: :true
  validates :email, uniqueness: :true
end
