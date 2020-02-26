class BicyclesController < ApplicationController
  # before_action :find_bicycle, only: %i(show)
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bicycles = Bicycle.all
    @bicycles = Bicycle.geocoded #returns flats with coordinates

    @markers = @bicycles.map do |bicycle|
      {
        lat: bicycle.latitude,
        lng: bicycle.longitude
      }
    end
  end

  def show
    @bicycle = Bicycle.find(params[:id])
    @booking = Booking.new
  end

  # def new
  #   @bicycle = Bicycle.new
  # end
  # def create
  #   @bicycle = Bicycle.new
  #   if @bicycle.save
  #     redirect_to bicycle_path(@bicycle)
  #   else
  #     render :new
  #   end
  # end
  # private
  # def bicycle_params
  #   params.require(:bicycle).permit(:name, :photos [], :day_price, :address, :description, :category)
  # end
  # def find_bicycle
  #   @bicycle = Bicycle.find(params[:id])
  # end

end
