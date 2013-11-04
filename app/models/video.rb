class Video < ActiveRecord::Base
  attr_accessible :thumbnail_large, :thumbnail_medium, :thumbnail_small, :vimeo_id, :description, 
                  :title, :id, :url, :upload_date, :duration, :processed, :width, :height, :is_hd, 
                  :displayed, :location, :url_route, :order

  has_many :video_photos, :dependent => :destroy
  has_many :video_audio_files, :dependent => :destroy

  before_destroy :delete_from_vimeo
  before_update :ensure_safe_route
  before_update :sync_video_with_vimeo

  def self.sorted_by_order
    Video.all.sort_by{|i| i.order}
  end

  def ensure_safe_route
    self.url_route = self.title.squeeze(" ").chomp.gsub(" ", "-") if self.url_route.nil? or self.url_route == ""
    self.url_route = self.url_route.squeeze(" ").chomp.gsub(" ", "-")
  end

  def self.refresh

    video_auth = Vimeo::Advanced::Video.new(VIMEO[:consumer_key], VIMEO[:consumer_secret], :token => VIMEO[:vimeo_token], :secret => VIMEO[:vimeo_secret])
    videos = video_auth.get_all(VIMEO[:vimeo_account])["videos"]["video"].select{|i| i["privacy"] != "password"}.map{|video| video["id"].to_i}
        
    videos.each do |vimeo_id|
      video = Vimeo::Simple::Video.info(vimeo_id).first
      Video.find_or_create_by_id(vimeo_id).update_attributes(
        :description      => video["description"],
        :url              => video["url"],
        :upload_date      => DateTime.parse(video["upload_date"]),
        :thumbnail_small  => video["thumbnail_small"],
        :thumbnail_medium => video["thumbnail_medium"],
        :thumbnail_large  => video["thumbnail_large"],
        :duration         => video["duration"],
        :processed        => (video["duration"] != 0),
        :width            => video["width"],
        :height           => video["height"],
        :title            => video["title"],
        :is_hd            => video["is_hd"]
        )
    end
  end

  def delete_from_vimeo
    begin
      video = Vimeo::Advanced::Video.new(VIMEO[:consumer_key], VIMEO[:consumer_secret], :token => VIMEO[:vimeo_token], :secret => VIMEO[:vimeo_secret])
      video.delete(self.id)
    rescue Exception=>e
      puts "No Video to delete"
    end
  end

  def sync_video_with_vimeo
    video = Vimeo::Advanced::Video.new(VIMEO[:consumer_key], VIMEO[:consumer_secret], :token => VIMEO[:vimeo_token], :secret => VIMEO[:vimeo_secret])
    video.set_description(self.id, self.description)
    video.set_title(self.id, self.title)
  end

  def as_json(options={})
    super(options).merge(
      :photos=>self.video_photos
      )
  end

end
