class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past,
  :end_date_cannot_be_before_start_date

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if start_date > end_date
      errors.add(:end_date, "can't be before starting date")
    end
  end
end
