class UserMailer < ApplicationMailer

  def forgot_password (user)
    @user = user
    @greeting = 'Hola'

    mail to: user.email, :subject => "Instrucciones para recuperar su contrasena"
  end

  def welcome (user)
    @user = user

    mail to: user.email, :subject => "Bienvenido al Club de Compras D'One Sitios"
  end

end