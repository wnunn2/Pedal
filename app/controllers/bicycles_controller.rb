class BicyclesController < ApplicationController
  # before_action :find_bicycle, only: %i(show)
  def index
    @bicycles = Bicycle.all
  end
  # def show
  # end
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
  #   params.require(:bicycle).permit(:name, :photo, :day_price, :address, :description, :category)
  # end
  # def find_bicycle
  #   @bicycle = Bicycle.find(params[:id])
  # end

end
