class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.string :type
      t.string :city
      t.string :address
      t.string :name
      t.integer :price
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
