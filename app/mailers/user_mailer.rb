class UserMailer < ApplicationMailer

  def forgot_password (user)
    @user = user
    @greeting = 'Hola'

    mail to: user.email, :subject => "Instrucciones para recuperar su contrasena"
  end

end