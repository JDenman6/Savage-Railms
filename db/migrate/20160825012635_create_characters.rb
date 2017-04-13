class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :agility
      t.integer :smarts
      t.integer :spirit
      t.integer :strength
      t.integer :vigor

      t.timestamps
    end
  end
end
