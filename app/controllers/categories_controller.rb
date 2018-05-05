class CategoriesController < ApplicationController

  # GET /categories/index
  def index

    @categories = Category.all
    json_response(@categories, :ok, [:subcategories])

  end

  # GET /categories/:id
  def show

    @category = Category.find_by(id: params[:id])
    json_response(@category, :ok, [:subcategories])

  end

  # POST /categories/create
  def create

    category = Category.create(category_params)

    if category.save
      response = {message: 'Categoria creada correctamente'}
      json_response(response, :created)
    else
      render :json => category.errors, status: :unprocessable_entity
    end

  end

  # DELETE /categories/:id
  def destroy

    @category = Category.find_by(id: params[:id])

    if @category
      @category.destroy
      render :json => {message: 'Categoria Eliminada'}, status: 200
    else
      render :json => {error: 'not-found'}, status: 404
    end

  end

  private

  def category_params

    params.permit(:id, :name)

  end

end