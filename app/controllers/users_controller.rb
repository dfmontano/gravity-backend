class UsersController < ApplicationController

  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = {message: Message.account_created, auth_token: auth_token}
    json_response(response, :created)
  end

  # GET users/index
  def index
    @users = User.all

    authorize @users
    json_response(@users, :ok, [:roles])
    # render :json => @users, :include => [:roles]
  end

  # GET users/show/:id
  def show
    @user = User.find_by(id: params[:id])

    if @user
      json_response(@user, :ok, [:roles])
    else
      render :json => {error: 'not-found'}, status: 404
    end
  end

  # DELETE users/:id
  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      render :json => {message: 'Usuario Eliminado'}, status:200
    else
      render :json => {error: 'not-found'}, status: 404
    end
  end

  private

  def user_params
    params.permit(:id, :cedula, :nombres, :apellidos, :email, :password, :password_confirmation)
  end

end
