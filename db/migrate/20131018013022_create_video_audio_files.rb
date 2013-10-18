class CreateVideoAudioFiles < ActiveRecord::Migration
  def change
    create_table :video_audio_files do |t|
      t.integer :video_id
      t.attachment :audio_file
      t.timestamps
    end
  end
end
