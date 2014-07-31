class AddAbilityScoresToCharacters < ActiveRecord::Migration
  def change
  	add_column :characters, :health, :integer
  	add_column :characters, :health_sigma, :integer
  	add_column :characters, :strength, :integer
  	add_column :characters, :strength_sigma, :integer
  	add_column :characters, :dexterity, :integer
  	add_column :characters, :dexterity_sigma, :integer
  	add_column :characters, :constitution, :integer
  	add_column :characters, :constitution_sigma, :integer
  	add_column :characters, :intelligence, :integer
  	add_column :characters, :intelligence_sigma, :integer
  	add_column :characters, :wisdom, :integer
  	add_column :characters, :wisdom_sigma, :integer
  	add_column :characters, :charisma, :integer
  	add_column :characters, :charisma_sigma, :integer

  end
end
