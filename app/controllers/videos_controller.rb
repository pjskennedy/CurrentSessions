require 'open-uri'

class VideosController < ApplicationController

  respond_to :json

  def upload
    if admin_signed_in?
      upload = Vimeo::Advanced::Upload.new(APP_CONFIG["CONSUMER_KEY"], APP_CONFIG["CONSUMER_SECRET"], :token => APP_CONFIG["VIMEO_TOKEN"], :secret => APP_CONFIG["VIMEO_SECRET"])
      video  = Vimeo::Advanced::Video.new( APP_CONFIG["CONSUMER_KEY"], APP_CONFIG["CONSUMER_SECRET"], :token => APP_CONFIG["VIMEO_TOKEN"], :secret => APP_CONFIG["VIMEO_SECRET"])
        # Upload the video
      video_id = upload.upload(params["datafile"].as_json["tempfile"].path)["ticket"]["video_id"]
        # Change description and title
      @video = Video.create(:vimeo_id => video_id.to_i, :title => params["video_title"], :description => params["video_description"])
      video.set_description( video_id, params["video_description"] )
      video.set_title( video_id, params["video_title"] )
      respond_with(current_admin) do |format|
        format.html {redirect_to admin_path }
      end
      return
    else
      respond_with false
      redirect_to '/'
    end
  end

  def index
    respond_with Video.all.as_json
  end

  def edit
    if admin_signed_in?
      respond_with true
    end
  end

  def delete
    if admin_signed_in?
      video = Vimeo::Advanced::Video.new(APP_CONFIG["CONSUMER_KEY"], APP_CONFIG["CONSUMER_SECRET"], :token => APP_CONFIG["VIMEO_TOKEN"], :secret => APP_CONFIG["VIMEO_SECRET"])
      video.delete(params["vimeo_id"])
      Video.find_by_vimeo_id(params["vimeo_id"]).destroy
      respond_with true
    else
      respond_with false
    end
  end
end
