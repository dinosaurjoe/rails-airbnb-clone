class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @booking.check_in = params[:check_in]
    @booking.check_out = params[:check_out]
    @booking.user = User.find(params[:user_id])
    @booking.boat = Boat.find(params[:boat_id])

  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to new_boat_path
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end


  private

  def booking_params
    params.require(:booking).permit(:boat_id, :user_id, :check_out, :check_in)
  end
end
