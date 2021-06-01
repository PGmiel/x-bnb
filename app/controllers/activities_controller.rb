class ActivitiesController < ApplicationController
  before_action :set_activity, only: [ :show, :edit, :update, :destroy ]

  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = Activity.new # needed to instantiate the form_for
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.save

    # no need for app/views/activitys/create.html.erb
    redirect_to activity_path(@activity)
  end

  def edit
  end

  def update
    @activity.update(activity_params)

    # no need for app/views/activitys/update.html.erb
    redirect_to activity_path(@activity)
  end

  def destroy
  @activity.destroy

  # no need for app/views/activities/destroy.html.erb
  redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :address, :price)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

end
