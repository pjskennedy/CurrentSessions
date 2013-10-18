class VideoAudioFile < ActiveRecord::Base

  attr_accessible :audio_file, :video_id
  belongs_to :video

  has_attached_file :clip

  validates_attachment_presence :audio_file
  validates_attachment_content_type :audio_file, 
                                    :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ],
                                    :message => 'File must be of filetype .mp3'

  :storage => :s3,
  
  :s3_credentials => "#{Rails.root}/config/s3.yml"

end
