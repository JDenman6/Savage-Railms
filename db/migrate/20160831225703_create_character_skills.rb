class CreateCharacterSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :character_skills do |t|
      t.string :name
      t.integer :character_attribute_id
      t.text :description

      t.timestamps
    end
  end
end
