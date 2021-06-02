class ReviewsController < ApplicationController
  before_action :set_review, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: :show

  def new
    @review = Review.new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @review = Review.new(review_params)
    @activity = Activity.find(params[:activity_id])
    @review.activity = @activity
    @review.user = current_user
    if @review.save!
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
