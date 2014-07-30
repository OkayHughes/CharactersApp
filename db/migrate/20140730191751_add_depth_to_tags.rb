class AddDepthToTags < ActiveRecord::Migration
  def change
  	add_column :tags, :depth, :integer
  end
end
