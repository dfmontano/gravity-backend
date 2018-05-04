class CategoriesController < ApplicationController

  def create

    category = Category.create(category_params)

    if category.save
      response = {message: 'Categoria creada correctamente'}
    else
      render :json => category.errors, status: :unprocessable_entity
    end

  end

  private

  def category_params

    params.permit(:id, :name)

  end

end