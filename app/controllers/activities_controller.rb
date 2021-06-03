class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    if params[:category]
      # @activities = Activity.where(category_id: params[:category])
      @activities = CategoryActivity.where(category_id: params[:category]).map{ |category_activity| category_activity.activity }
    else
      @activities = Activity.all
    end
     @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
      end
  end

  def show
    @booking = Booking.new
  end

  def new
    @activity = Activity.new # needed to instantiate the form_for
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @activity.save
    # no need for app/views/activitys/create.html.erb
    redirect_to activity_path(@activity)
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy

    # no need for app/views/activities/destroy.html.erb
    redirect_to activities_path


  def user_activities
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :address, :price, category_ids: [], photos: [])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
