class AddLocationToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :location, :string, :default => ""
  end
end
