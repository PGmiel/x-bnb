class Category < ApplicationRecord
  has_many :category_activities
  has_many :activities, through: :category_activities
  has_one_attached :photo
end
