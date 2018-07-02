class SubcategoriesController < ApplicationController

  skip_before_action :index_by_category, only: [:index_by_category]

  # GET /categories/:id_category/subcategories
  def index_by_category
    @subcategories = Subcategory.where(category_id: params[:category_id])
    json_response(@subcategories, :ok)
  end

  # POST /subcategories/create
  def create
    subcategory = Subcategory.create(subcategory_params)
    if subcategory.save
      response = {message: 'Subcategoria creada correctamente'}
      json_response(response, :created)
    else
      render :json => subcategory.errors, status: :unprocessable_entity
    end
  end

  private

  def subcategory_params
    params.permit(:id, :name, :category_id)
  end

end