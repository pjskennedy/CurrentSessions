class CreateVideoTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :vimeo_id
      t.string :thumbnail_small
      t.string :thumbnail_medium
      t.string :thumbnail_large
      t.timestamps
    end
  end
end
