class Activity < ApplicationRecord
  belongs_to :user
  has_many :category_activities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :bookings
  has_many :categories, through: :category_activities

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :description, :price, presence: true
end
