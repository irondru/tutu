class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]

  include TicketsHelper

  def index
    @tickets = get_tickets_pre_params
  end

  def show
    @ticket = get_ticket_params(
        @ticket.attributes.symbolize_keys, true)
  end

  def new
    @full_params = get_ticket_params(choice_params, true)
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to tickets_path
    else
      @full_params = get_ticket_params(ticket_params, true)
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:first_station_id, :last_station_id,
                                   :train_id, :first_name, :last_name,
                                   :passport_number)
  end

  def choice_params
    params.require(:choice).permit(:first_station_id, :last_station_id, :train_id)
  end

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end
end
