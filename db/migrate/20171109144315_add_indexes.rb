class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :railway_stations_routes, :route_id
    add_index :railway_stations_routes, :railway_station_id #есть поиск маршрутов в которые входит станция
  end
end
