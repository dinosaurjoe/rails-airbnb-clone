class DashboardsController < ApplicationController
  def show
    @user = current_user
    @boats = @user.boats
    @bookings = @user.bookings
  end
end
