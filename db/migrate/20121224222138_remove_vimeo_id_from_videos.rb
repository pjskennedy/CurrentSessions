class RemoveVimeoIdFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :vimeo_id
  end
end
