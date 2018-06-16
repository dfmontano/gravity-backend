class UsersController < ApplicationController

  # wrap_parameters format: [:json, :url_encoded_form, :multipart_form]
  skip_before_action :authorize_request, only: [:create, :check_email, :check_cedula, :name]

  # POST /signup
  def create
    user = User.create(user_params)
    # return authenticated token upon signup
    if user.save
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = {message: Message.account_created, auth_token: auth_token}
      json_response(response, :created)
      # Sends welcome email to new user
      user.send_welcome
      # Sends email to admin with user data
      user.send_registered
    else
      render :json => user.errors, status: :unprocessable_entity
    end
  end

  # GET /users/current
  def current
    render :json => current_user, status: :ok, include: [:roles]
  end

  # GET /users/name/:id
  def name
    @user = User.select('id, nombres, apellidos').where(id: params[:id])
    render :json => @user, status: :ok
  end

  # GET /users/index
  def index
    @users = User.all

    authorize @users
    json_response(@users, :ok, [:roles])
    # render :json => @users, :include => [:roles]
  end

  # GET /users/show/:id
  def show
    @user = User.find_by(id: params[:id])
    authorize @user
    if @user
      json_response(@user, :ok, [:roles, :club_cards])
    else
      render :json => {error: 'not-found'}, status: 404
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find_by(id: params[:id])
    authorize @user
    if @user
      @user.destroy
      render :json => {message: 'Usuario Eliminado'}, status: 200
    else
      render :json => {error: 'not-found'}, status: 404
    end
  end

  # PATCH /users/password/update
  def update_password
    @user = current_user
    # Check if current user exists (logged)
    if @user
      new_password = BCrypt::Password.create(params[:new_password])

      if @user.update(password_digest: new_password)
        render :json => {message: 'Contrasena actualizada correctamente'}, status: 200
      else
        render :json => @user.errors, status: :unprocessable_entity
      end
    else
      render :json => {message: 'No esta autorizado para realizar esta accion'}, status: 403
    end
  end

  def check_email
    email = params[:email]
    if User.exists?(email: email)
      render :json => {message: 'taken'}, status: 200
    else
      render :json => {message: 'available'}, status: 200
    end
  end

  def check_cedula
    cedula = params[:cedula]
    if User.exists?(cedula: cedula)
      render :json => {message: 'taken'}, status: 200
    else
      render :json => {message: 'available'}, status: 200
    end
  end

  private

  def user_params
    params.permit(:id, :cedula, :nombres, :apellidos, :email, :password, :password_confirmation, :new_password,
                  :avatar, :celular, :convencional, :calle_principal, :calle_secundaria, :referencia, :city, :province)
  end

end
