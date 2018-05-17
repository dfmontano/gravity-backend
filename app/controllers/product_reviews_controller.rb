class ProductReviewsController < ApplicationController

  # GET /products/:product_id/reviews
  def index
    @product_reviews = ProductReview.where(product_id: params[:product_id])
    if @product_reviews
      render :json => @product_reviews, status: :ok, include: [:user]
    else
      render :json => {message: 'No reviews for this product found yet'}, status: 404
    end
  end

  # POST /products/reviews/create
  def create
    @product_review = ProductReview.create(product_review_params)
    if @product_review.save
      render :json => {message: 'Comentario creado'}, status:200
    else
      render :json => @product_review.errors, status: :unprocessable_entity
    end
  end

  private

  def product_review_params
    params.permit(:id, :product_id, :user_id, :stars)
  end

end