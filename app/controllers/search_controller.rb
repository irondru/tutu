class SearchController < ApplicationController

  include SearchHelper

  def index
    # в зависимости от запроса отдаем или вьюху или json с результатами поиска
    respond_to do |format|
      format.html {@stations = RailwayStation.all}
      format.json {render json: find_data(search_params)}
    end
  end

  private

  def search_params
    params.require(:search).permit(:first_station, :last_station)
  end

end