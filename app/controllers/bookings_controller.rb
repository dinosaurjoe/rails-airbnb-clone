class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
    # @booking.check_in = params[:check_in]
    # @booking.check_out = params[:check_out]
    @booking.user = current_user
    @booking.boat = @boat

  end

  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.user = current_user
    @booking.boat = @boat
    p @booking
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to new_boat_booking_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:boat_id, :user_id, :check_out, :check_in)
  end
end
