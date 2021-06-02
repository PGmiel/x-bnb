class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_before_action :authenticate_user!, only: :host

  def home
    @categories = Category.all
  end

  def host
    @categories = Category.all
    @reviews = Review.all
    @activities = Activity.all
  end
end
