class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  before_action :set_railway_stations, only: [:new, :create, :edit, :update]

  def index
    @routes = Route.all
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        stations = {}
        @route.railway_stations.each {|station| stations[station.title] = station.id}
        render json: stations
      end
    end
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    @route.add_schedules(schedule_params)
    if @route.save
      redirect_to admin_routes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @route.add_schedules(schedule_params)
    if @route.update(route_params)
      redirect_to admin_routes_path
    else
      render :edit
    end
  end

  def destroy
    @route.railway_stations_routes.where(route_id: @route.id).delete_all #подчищаем join-таблицу
    @route.destroy
    redirect_to admin_routes_path, notice: 'Route was successfully destroyed.'
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def set_railway_stations
    @railway_stations = RailwayStation.all
  end

  def route_params
    params.require(:route).permit(:number, railway_station_ids: [])
  end

  def schedule_params
    params.require(:schedule).permit(arrivals: [], departures: [])
  end


end