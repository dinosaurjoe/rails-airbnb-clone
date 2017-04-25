class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home :index :user_show :boat_show

  def home
  end
end
