class ProductsController < ApplicationController

  skip_before_action :authorize_request, only: [:index_approved, :show, :featured]

  # GET /products/index
  def index
    @products = Product.all
    json_response(@products, :ok)
  end

  def create
    product = Product.create(product_params)
    if product.save
      response = {message: 'Producto creado correctamente'}
      json_response response, :created
    else
      render :json => product.errors, status: :unprocessable_entity
    end
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
      json_response(product, :ok, [:store, :category, :subcategory, :product_reviews => {:include => :user}], [:available, :reviews, :discount_price])
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

  def featured
    @products = Product.where(:approved => true).order(:ventas).limit(10)
    render :json => @products, methods: [:rating], status: :ok
  end

  private

  def product_params
    params.permit(:id, :name, :description, :category_id, :subcategory_id, :sku, :stock, :price, :discount, :store_id, :approved, {images: []})
  end

end