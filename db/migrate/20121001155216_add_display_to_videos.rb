class AddDisplayToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :displayed, :boolean, :default => false
  end
end
