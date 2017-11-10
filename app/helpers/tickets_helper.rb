module TicketsHelper

  def get_ticket_params(params, full_info = false)
    stations = RailwayStation.find(params[:first_station_id], params[:last_station_id])
    params[:first_station_title] = stations[0].title
    params[:last_station_title] = stations[1].title
    train = Train.find(params[:train_id])
    params[:train_number] = train.number
    if full_info
      params[:departure] = train.route.railway_stations_routes.where(
          railway_station_id: params[:first_station_id]).first.departure
      params[:arrival] = train.route.railway_stations_routes.where(
          railway_station_id: params[:last_station_id]).first.arrival
      params[:route_name] = train.route.name
      params[:route_number] = train.route.number
    end
    params
  end

  def get_tickets_pre_params
    rezult = []
    current_user.tickets.each do |ticket|
      rezult << get_ticket_params(ticket.attributes.symbolize_keys)
    end
    rezult
  end

end