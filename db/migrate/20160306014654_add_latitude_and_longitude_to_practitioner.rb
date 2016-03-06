class AddLatitudeAndLongitudeToPractitioner < ActiveRecord::Migration
  def change
    add_column :practitioners, :latitude, :float
    add_column :practitioners, :longitude, :float
  end
end
