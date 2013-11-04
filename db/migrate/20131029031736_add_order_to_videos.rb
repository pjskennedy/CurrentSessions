class AddOrderToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :order, :integer, :default => 0
  end
end
