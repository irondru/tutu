class TicketMailer < ApplicationMailer

  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Tutu')
  end
end