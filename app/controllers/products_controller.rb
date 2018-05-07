class ProductsController < ApplicationController

  # GET /products/index
  def index
    @products = Product.all
    json_response(@products, :ok)
  end

  # GET /products/:id
  def show
    product = Product.find_by(id: params[:id])
    if product
      json_response(product, :ok)
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

  private

  def product_params
    params.permit(:id, )
  end

end