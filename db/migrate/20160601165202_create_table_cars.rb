class CreateTableCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :available, default: true

      t.timestamps null: false
    end
  end
end
