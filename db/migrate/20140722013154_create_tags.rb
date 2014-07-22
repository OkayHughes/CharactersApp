class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :key
      t.string :value
      t.string :character_id
      t.timestamps
    end
    add_index :tags, :character_id
  end
end
