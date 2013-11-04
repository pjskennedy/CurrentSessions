class VideoPhoto < ActiveRecord::Base

  attr_accessible :photo, :video_id
  belongs_to :video

  has_attached_file :photo, 
    :styles => { large: '1000x648>', display: '500x324', :icon => "50x50"},
    :default_style => :display,
    :storage => :s3,
    :s3_credentials => {
      :access_key_id     => S3[:secret],
      :secret_access_key => S3[:key]
    },
    :bucket => S3[:bucket]

  def as_json(options={})
    super(options).merge(:photo_large => self.photo(:large))
  end

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:photo_file_name),
      "size" => read_attribute(:photo_file_size),
      "url" => self.photo(:display),
      "delete_url" => admins_video_video_photo_url(:video_id => self.video_id, :id => self.id, :subdomain => "admin", :only_path => true),
      "delete_type" => "DELETE" 
    }
  end 

end