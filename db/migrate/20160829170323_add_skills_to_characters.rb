class AddSkillsToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :skills, :text
  end
end
