class AddArrivalAndDepartureTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :arrival, :string
    add_column :railway_stations_routes, :departure, :string
  end
end
