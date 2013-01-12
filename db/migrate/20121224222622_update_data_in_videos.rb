class UpdateDataInVideos < ActiveRecord::Migration
  def change
    add_column :videos, :is_hd, :boolean
    add_column :videos, :upload_date, :datetime
    add_column :videos, :duration, :integer
    add_column :videos, :width, :integer
    add_column :videos, :height, :integer
    add_column :videos, :url, :string
    add_column :videos, :processed, :boolean
    remove_column :videos, :x_coordinate
    remove_column :videos, :y_coordinate
  end
end
