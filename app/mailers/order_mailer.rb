class OrderMailer < ApplicationMailer
  def orderconfirmation_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Solicitud de pedido recibida')
  end

  def orderproblem_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Ha ocurrido un problema con tu pedido')
  end

  def pedidoentregado_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Tu pedido ha sido entregado!')
  end
end
