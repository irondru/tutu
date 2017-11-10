class Route < ApplicationRecord
  validates :number, presence: {message: 'Номер не может быть пустым!'},
            uniqueness: {message: 'Такой маршрут уже существует!'},
            format: {with: /\A\w{3,10}\z/i}
  #validates_associated :railway_stations # что то не работает
  validate :check_stations

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  def name
    if railway_stations.present?
      validate ? "#{ railway_stations[0].title } - #{ railway_stations[-1].title }" : 'Неверный маршрут'
    end
  end

  # добовляем расписание
  def add_schedules(params)
    railway_stations_routes.each_with_index do |item, index|
      item.arrival = params[:arrivals][index]
      item.departure = params[:departures][index]
      item.save unless new_record?
    end
  end

  def check_stations
    errors.add(:base, 'Станций то нехватает!') if railway_stations_routes.size != railway_stations.size
    errors.add(:base, 'Маршрут должен состоять как минимум из 2-х станций') if railway_stations.size < 2
  end

end