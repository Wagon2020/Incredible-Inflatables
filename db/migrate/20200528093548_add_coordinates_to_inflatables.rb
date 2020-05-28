class AddCoordinatesToInflatables < ActiveRecord::Migration[6.0]
  def change
    add_column :inflatables, :latitude, :float
    add_column :inflatables, :longitude, :float
  end
end
