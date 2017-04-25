class DashboardsController < ApplicationController
  def show
    @user = current_user
    @boats = @user.boats
    @boat_requests = @boats.bookings
    @bookings = @user.bookings
  end
end
