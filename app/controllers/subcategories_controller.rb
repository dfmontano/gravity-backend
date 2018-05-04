class SubcategoriesController < ApplicationController

  private

  def subcategory_params

    params.permit(:id, :name, :category_id)

  end

end