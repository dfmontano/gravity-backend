class CategoriesController < ApplicationController

  skip_before_action :authorize_request, only: [:index, :show, :gtfo]

  # GET /categories/index
  def index

    @categories = Category.all.order(:name)
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

  def gtfo
    render :json => {message: 'F*ck you'}, status: :forbidden
  end

  private

  def category_params

    params.permit(:id, :name)

  end

end