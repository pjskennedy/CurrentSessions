class VideoAudioFile < ActiveRecord::Base

  attr_accessible :audio_file, :video_id
  belongs_to :video

  has_attached_file :audio_file,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml"

  validates_attachment_presence :audio_file

end
