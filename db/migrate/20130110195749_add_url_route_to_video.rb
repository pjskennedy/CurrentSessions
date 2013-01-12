class AddUrlRouteToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :url_route, :string
  end
end
