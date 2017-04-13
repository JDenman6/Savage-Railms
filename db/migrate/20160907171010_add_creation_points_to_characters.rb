class AddCreationPointsToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :creation_points, :integer, :default => 25
  end
end
