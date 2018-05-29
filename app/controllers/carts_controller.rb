class CartsController < ApplicationController

  # GET /users/:id_user/carts/:id
  def show

    @cart = Cart.find_by(user_id: params[:user_id], id: params[:id])
    if @cart
      json_response @cart, :ok, [:products => {:methods => :available}]
    end

  end

  private

  def cart_params
    params.permit(:user_id, :id)
  end

end