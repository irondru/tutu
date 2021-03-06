class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)
    if @railway_station.save
      redirect_to admin_railway_stations_path
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_stations_path, notice: 'Railway station was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path, notice: 'Railway station was successfully destroyed.'
  end

  private

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title, :region)
  end

end
