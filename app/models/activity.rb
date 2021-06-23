class Activity < ApplicationRecord
  belongs_to :user
  has_many :category_activities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :bookings
  has_many :categories, through: :category_activities
  has_many_attached :photos

  validates :name, :description, :price, presence: true

  def avg_rating
    if self.reviews.count == 0
      "No ratings yet"
    else
      sum = 0
      self.reviews.each do |review|
        sum += review.rating
      end
      return (sum.to_f / self.reviews.count)
    end
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
