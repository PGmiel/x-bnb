class BookingsController < ApplicationController
before_action :set_booking, only: [ :show, :edit, :update, :destroy ]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    # we need @activity in our `simple_form_for`
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # we need `activity_id` to associate booking with corresponding activity
    @activity = Activity.find(params[:activity_id])
    @booking.activity = @activity
    if @booking.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)

    # no need for app/views/bookings/update.html.erb
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to activity_path(@booking.activity)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_booking
     @booking = Booking.find(params[:id])
  end
end
