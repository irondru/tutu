class TicketMailer < ApplicationMailer

  default from: 'no-reply@ih764316.vds.myihor.ru'

  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Tutu')
  end
end