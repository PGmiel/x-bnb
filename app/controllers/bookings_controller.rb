class BookingsController < ApplicationController

  def new
    # we need @activity in our `simple_form_for`
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new
  end

end
