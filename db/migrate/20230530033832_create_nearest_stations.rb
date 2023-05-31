class CreateNearestStations < ActiveRecord::Migration[6.1]
  def change
    create_table :nearest_stations do |t|
      t.string :route_name
      t.string :station_name
      t.string :walking_minutes

      t.timestamps
    end
  end
end
