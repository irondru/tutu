class RailwayStation < ApplicationRecord

  validates :title,
            presence: {message: 'Название не должно быть пустым!'},
            uniqueness: {message: 'Станция с таким именем уже существует!'},
            format: {with: /\A[ _\-0-9a-zа-я]{3,42}\z/i}
  validates :region, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 99,
                                    only_integer: true, allow_nil: true}

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

end
