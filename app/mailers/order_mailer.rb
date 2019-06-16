class OrderMailer < ApplicationMailer
  def orderconfirmation_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Solicitud de pedido recibida ')
  end
end
