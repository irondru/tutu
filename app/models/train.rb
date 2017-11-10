class Train < ApplicationRecord

  validates :number, presence: true,
            uniqueness: true,
            format: {with: /\A\w{3,10}\z/i}

  belongs_to :route, optional: true
  belongs_to :railway_station, optional: true
  has_many :tickets
  has_many :carriages

  # находим поезда у которых в маршруте есть нужные станции
  def self.find_by_route_stations(params)
    rezult = []
    trains = Train.all
    stations = RailwayStation.find(params[:first_station], params[:last_station])
    trains.each do |train|
      next if train.route.nil?
      if train.route.railway_stations & stations == stations #если обе станции есть в маршруте
        #и станция отправления находится перед станцией назначения
        if train.route.railway_stations.index(stations[0]) < train.route.railway_stations.index(stations[1])
          rezult << train
        end
      end
    end
    rezult
  end

  def total_places(carriage_type, places_type)
    carriages.where(type: carriage_type).sum(places_type)
  end

end
