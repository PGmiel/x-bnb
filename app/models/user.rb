class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
