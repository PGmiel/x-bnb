class Activity < ApplicationRecord
  belongs_to :user
  has_many :category_activities
  has_many :bookings
  has_many :reviews
  has_many :users, through: :bookings
  has_many :categories, through: :category_activities

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :description, :price, presence: true
end
