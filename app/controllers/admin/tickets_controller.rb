class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_trains, only: [:new, :create, :edit, :update]
  before_action :set_users

  include TicketsHelper

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = get_ticket_params(@ticket.attributes.symbolize_keys, true)
    render 'tickets/show'
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to admin_tickets_path
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_tickets_path
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_users
    @users = User.all
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_trains
    @trains = Train.all
  end

  def ticket_params
    params.require(:ticket).permit(:user_id, :first_name, :last_name, :passport_number,
                                   :train_id, :first_station_id, :last_station_id)
  end
end
