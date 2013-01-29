class RemoveTitleFromLink < ActiveRecord::Migration
  def up
  	remove_column :links, :title
  end

  def down
  	add_column :links, :title, :string
  end
end
