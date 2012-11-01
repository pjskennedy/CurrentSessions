class ChangeColumnsInVideos < ActiveRecord::Migration
  def change
    add_column :videos, :x_coordinate, :float
    add_column :videos, :y_coordinate, :float
    rename_column :videos, :name, :title
    remove_column :videos, :location    
  end
end
