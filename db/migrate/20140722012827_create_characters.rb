class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :bio
      t.string :name

      t.timestamps
    end
  end
end
