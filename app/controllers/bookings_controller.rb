class BookingsController < ApplicationController

  def create
    @bicycle = Bicycle.find(params[:bicycle_id])
    @booking = Booking.new(booking_params)
    @booking.bicycle = @bicycle
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "bicycles/show"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
