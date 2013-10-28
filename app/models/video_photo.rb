class VideoPhoto < ActiveRecord::Base

  attr_accessible :photo, :video_id
  belongs_to :video

  has_attached_file :photo, 
    :styles => { large:    '1000x648>' },
    :default_style => :display,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml"

  def as_json(options={})
    super(options).merge(
      :photo_large   => self.photo(:large)
      )
  end
end