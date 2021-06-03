class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews
  has_many :activity_reviews, through: :activities, source: :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def seller?
    activities.present?
  end
end

# current_user.seller?
# to make paths accesssbile oly for user with activities on sold
