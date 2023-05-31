class AddPropertyReferencesToNearestStations < ActiveRecord::Migration[6.1]
  def change
    add_reference :nearest_stations, :property, foreign_key: true
  end
end
