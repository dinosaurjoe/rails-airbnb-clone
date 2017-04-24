class BoatsController < ApplicationController
  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create

  end

  def index
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
