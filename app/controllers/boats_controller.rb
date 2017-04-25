class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @boat = Boat.find(params[:id])
    @owner = @boat.user
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @bost.user = current_user
    if @boat.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def index
    p boat_params
    @boats_by_city = Boat.where({ city: boat_params[:city], category: boat_params[:category] })
    p @boats_by_city
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
  end

  private

  def boat_params
    params.require(:boat).permit(:category, :city, :price, :address, :capacity, :name)
  end
end
