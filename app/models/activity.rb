class Activity < ApplicationRecord
  belongs_to :user
  has_many :category_activities
  has_many :bookings
  has_many :reviews
  has_many :users, through: :bookings
  has_many :categories, through: :category_activities

  validates :name, :description, :price, presence: true
end
