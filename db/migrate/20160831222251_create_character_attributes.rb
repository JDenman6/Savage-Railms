class CreateCharacterAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_attributes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
