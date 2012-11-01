class AddColumnsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :name, :string
    add_column :videos, :location, :string
    add_column :videos, :description, :string
  end
end
