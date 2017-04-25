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
    if @boat.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def index
    @boats_by_city = Boat.find_by city: params[:city], type: params[:type]
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
    params.require(:boat).permit(:type, :city, :price, :address, :capacity, :user_id, :name)
  end
end
