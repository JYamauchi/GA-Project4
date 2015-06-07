class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.limit(500)
    @geojson = Array.new

    @restaurants.each do |restaurant|
      last_inspection = restaurant.inspections.last
      restaurant_info = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [restaurant.longitude.to_f,restaurant.latitude.to_f]
        },
        properties: {
          id: restaurant.id,
          title: restaurant.name,
          description: restaurant.address,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
        if last_inspection
          restaurant_info = restaurant_info.merge(last_inspection: last_inspection)
        end
      @geojson << restaurant_info
    end
    gon.geojson = @geojson
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end


  
  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

end
