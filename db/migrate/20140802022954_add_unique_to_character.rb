class AddUniqueToCharacter < ActiveRecord::Migration
  def change
  	add_column :characters, :unique, :boolean
  end
end
