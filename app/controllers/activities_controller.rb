class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @activities = Activity.all

    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
  end

  def show
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
    redirect_to user_activities_path
  end

  def user_activities
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :address, :price, category_ids: [])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
