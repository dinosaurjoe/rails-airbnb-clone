class RemoveTypeFromBoats < ActiveRecord::Migration[5.0]
  def change
    remove_column :boats, :type, :string
  end
end
