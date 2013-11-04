class VideoAudioFile < ActiveRecord::Base

  attr_accessible :audio_file, :video_id
  belongs_to :video

  has_attached_file :audio_file,
    :storage => :s3,
    :s3_credentials => {
      :access_key_id     => S3[:secret],
      :secret_access_key => S3[:key]
    },
    :bucket => S3[:bucket]



  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:audio_file_file_name),
      "size" => read_attribute(:audio_file_file_size),
      "url" => self.audio_file,
      "delete_url" => admins_video_video_audio_file_url(:video_id => self.video_id, :id => self.id, :subdomain => "admin", :only_path => true),
      "delete_type" => "DELETE" 
    }
  end 

end
