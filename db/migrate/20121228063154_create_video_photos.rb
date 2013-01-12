class CreateVideoPhotos < ActiveRecord::Migration
  def change
    create_table :video_photos do |t|
      t.attachment :photo
      t.integer :video_id

      t.timestamps
    end
  end
end
