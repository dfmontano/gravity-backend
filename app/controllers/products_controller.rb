class ProductsController < ApplicationController

  skip_before_action :authorize_request, only: [:index_approved, :show, :getFeatured]

  # GET /products/index
  def index
    @products = Product.all
    json_response(@products, :ok)
  end

  # GET /products/index/approved/:true or :false
  def index_approved
    if params[:approved] == 'true'
      @products = Product.where(approved: true)
    elsif params[:approved] == 'false'
      @products = Product.where(approved: false)
    end
    json_response(@products, :ok)
  end

  # PATCH /products/:id/visit
  def visit
    @product = Product.find_by(id: params[:id])
    if @product
      visits = @product.visits + 1
      @product.update(visits: visits)
    end
  end

  # GET /products/:id
  def show
    product = Product.find_by(id: params[:id])
    if product
      json_response(product, :ok, [:product_reviews => {:include => :user}], [:available])
    else
      render :json => {error: 'not-found'}, status: 404
    end
  end

  # DELETE /products/:id
  def destroy
    @product = Product.find_by(id: params[:id])
    if @product
      @product.destroy
      render :json => {message: 'Producto eliminado'}, status: 200
    else
      render :json => {message: 'not-found'}, status: 404
    end
  end

  def getFeatured
    @products = Product.all.order(:ventas).limit(20)
    json_response @products, :ok
  end

  private

  def product_params
    params.permit(:id, :approved)
  end

end