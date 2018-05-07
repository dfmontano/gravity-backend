class ProductReviewsController < ApplicationController

  # GET /products/:product_id/reviews
  def index
    @product_reviews = ProductReview.where(product_id: params[:product_id])
    if @product_reviews
      render :json => @product_reviews, status: :ok, include: [:user]
    else
      render :json => {message: 'Not reviews for this product found yet'}, status: 404
    end
  end

  def create

  end

  private

  def product_review_params
    params.permit(:id, :product_id, :user_id, :stars)
  end

end