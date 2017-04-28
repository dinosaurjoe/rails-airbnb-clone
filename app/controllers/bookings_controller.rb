class BookingsController < ApplicationController

  def show
    @booking = Booking.new(booking_params)
    @boat = params[:boat_id]
  end

  def new
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    # @booking.check_in = params[:check_in]
    # @booking.check_out = params[:check_out]
    @booking.user = current_user
    @booking.boat = @boat

  end

  def create
    @booking = Booking.new
    @booking.check_in = booking_params[:check_in]

    @booking.check_out = booking_params[:check_in]
    @boat = Boat.find(params[:boat_id])
    @booking.user = current_user
    @booking.boat = @boat
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_out, :check_in)
  end
end
