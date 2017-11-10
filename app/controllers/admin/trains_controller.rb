class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        render json: Train.find(params[:id]).route_id
      end
    end
  end

  def new
    @routes = Route.all
    @train = Train.new
  end

  def edit
    @routes = Route.all
  end

  def create
    @train = Train.new(train_params)
      if @train.save
        redirect_to admin_trains_path
      else
        @routes = Route.all
        render :new
      end
  end

  def update
      if @train.update(train_params)
        redirect_to admin_trains_path
      else
        render :edit
      end
  end

  def destroy
    @train.destroy
    redirect_to admin_trains_path, notice: 'Train was successfully destroyed.'
  end

  private

    def set_train
      @routes = Route.all
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number, :route_id, :railway_station_id, :carriage_order)
    end

end
