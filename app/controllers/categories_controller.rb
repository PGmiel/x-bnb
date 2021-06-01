class CategoriesController < ApplicationController
  def index
    if params[:query_id].present?
      category = Category.find_by(name: params[:query_id][:categories])
      redirect_to category_path(category)
    end
  end

  def show
    @category = Category.find(params[:id])
  end

end
