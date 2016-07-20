class CategoriesController < ApplicationController
  def show
    @category = user_tools_in_category
  end

  private

  def user_tools_in_category
    category = Category.find(params[:id])
    current_user.tools.where(category: category)
  end
end
