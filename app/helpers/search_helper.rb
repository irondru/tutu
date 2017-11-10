module SearchHelper

  # отдает массив хешей с результатами поиска
  def find_data(search_params)
    # ищем поезда у которых в маршруте есть нужные станции в нужном порядке
    trains = Train.find_by_route_stations(search_params)
    rezult = []
    trains.each do |train|
      return if train.nil? # уже забыл зачем это здесь когда решил написать коммент, возможно костыль
      # заполняем хеш параметров ответа поиска
      rezult << {
          route_number: train.route.number,
          train_number: train.number,
          train_id: train.id,
          route_name: train.route.name,
          first_station: search_params[:first_station],
          last_station: search_params[:last_station],
          departure: train.route.
              railway_stations_routes.where(railway_station_id: search_params[:first_station]).first.departure,
          arrival: train.route.
              railway_stations_routes.where(railway_station_id: search_params[:last_station]).first.arrival
      }
    end
    rezult
  end


end