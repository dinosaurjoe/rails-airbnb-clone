class AddCategoryToBoats < ActiveRecord::Migration[5.0]
  def change
    add_column :boats, :category, :string
  end
end
