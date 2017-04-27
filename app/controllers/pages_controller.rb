class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @boat = Boat.new
    @booking = Booking.new
  end
end
