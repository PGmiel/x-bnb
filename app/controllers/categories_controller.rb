class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    if params[:query_id].present?
      category = Category.find_by(name: params[:query_id][:categories])
      if category
        redirect_to category_path(category)
      else
        redirect_to root_path
      end
    end
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    # @activities = Activity.all
    @markers = @category.activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window: render_to_string(partial: "info_window", locals: { activity: activity }),
        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end
end
