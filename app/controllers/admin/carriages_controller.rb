class Admin::CarriagesController < Admin::BaseController

  before_action :set_carriage, only: [:edit, :show, :update, :destroy]
  before_action :set_train, only: [:index, :new, :create]

  def index
    @carriages = @train.carriages
  end

  def show

  end

  def new
    @carriage = Carriage.new
  end

  def edit

  end


  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to admin_train_carriages_path
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to admin_train_carriages_path
    else
      render :edit
    end

  end

  def destroy
    train_id = @carriage.train_id
    @carriage.destroy
    redirect_to admin_train_carriages_path(train_id), notice: 'Train was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def carriage_params
    params.require(:carriage).permit(:type, :top_places, :bottom_places,
                                     :side_top_places, :side_bottom_places, :sedentary_places)
  end

end
