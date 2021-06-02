class ReviewsController < ApplicationController
  before_action :set_review, only: [ :show, :destroy, :edit, :update ]
  skip_before_action :authenticate_user!, only: :show

  def show
  end

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

  def edit
    @activity = Activity.find(params[:activity_id])
  end

  def update
    @activity = Activity.find(params[:activity_id])
    if @review.update(review_params)
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path #to change
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
