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
    @boat.photo = "http://res.cloudinary.com/dpx3mlueo/image/upload/v1493307810/ri9dgybvbejrwdxyqwwu.jpg"  if boat_params[:photo].nil?
    @boat.user = current_user
    if @boat.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def index
    @boats = Boat.near(boat_params[:address], 20).where({ category: boat_params[:category] })

    @hash = Gmaps4rails.build_markers(@boats) do |boat, marker|
      marker.lat boat.latitude
      marker.lng boat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to @boat
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
  end

  private

  def boat_params
    params.require(:boat).permit(:category, :city, :price, :address, :capacity, :name, :photo, :description)
  end
end
