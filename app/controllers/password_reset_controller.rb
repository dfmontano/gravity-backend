class PasswordResetController < ApplicationController

  skip_before_action :authorize_request, only: [:create, :update]

  def create

    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    render :json => {message: 'Se ha enviado un correo con las instrucciones'}, status: 200

  end

  def update
    @user = User.find_by_password_reset_token!(params[:password_reset_token])
    if @user.password_reset_sent_at < 2.hour.ago
      render :json => {message: 'El enlace de recuperacion ha caducado'}, status: 401
    else
       password = BCrypt::Password.create(params[:new_password])
      if @user.update(password_digest: password)
        render :json => {message: 'Contrasena actualizada correctamente'}, status: 200
      else
        render :json => @user.errors, status: :unprocessable_entity
      end
    end
  end


end