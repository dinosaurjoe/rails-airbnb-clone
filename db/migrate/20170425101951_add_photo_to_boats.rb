class AddPhotoToBoats < ActiveRecord::Migration[5.0]
  def change
    add_column :boats, :photo, :string
  end
end
