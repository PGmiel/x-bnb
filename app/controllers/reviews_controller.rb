class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @activity = activity.find(params[:activity_id])
    @review.activity = @activity
  end

  def create
    @review = Review.new(review_params)
    @activity = activity.find(params[:activity_id])
    @review.activity = @activity
    if @review.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
