class PagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def host
    @categories = Category.all
    @reviews = Review.all
  end
end
