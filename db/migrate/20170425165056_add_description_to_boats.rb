class AddDescriptionToBoats < ActiveRecord::Migration[5.0]
  def change
    add_column :boats, :description, :string
  end
end
