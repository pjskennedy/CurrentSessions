
namespace :vimeo do
  desc "Updates the vimeo table"
  task :update => :environment do
    video = Vimeo::Advanced::Video.new(APP_CONFIG["CONSUMER_KEY"], APP_CONFIG["CONSUMER_SECRET"], :token => APP_CONFIG["VIMEO_TOKEN"], :secret => APP_CONFIG["VIMEO_SECRET"])
    videos = video.get_all("Peter Kennedy")["videos"]["video"].select{|i| i["privacy"] == "anybody"}.map{|i| i["id"].to_i }
    videos.each do |video_id|
      current_video = Video.find_or_create_by_vimeo_id(video_id)
      small = video.get_thumbnail_urls(video_id.to_s)["thumbnails"]["thumbnail"].first["_content"]
      medium = video.get_thumbnail_urls(video_id.to_s)["thumbnails"]["thumbnail"].second["_content"]
      large = video.get_thumbnail_urls(video_id.to_s)["thumbnails"]["thumbnail"].third["_content"]
      current_video.update_attributes(:thumbnail_small => small, :thumbnail_medium => medium, :thumbnail_large => large)
    end
  end
end