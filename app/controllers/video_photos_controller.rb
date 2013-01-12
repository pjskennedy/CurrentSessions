
class VideoPhotosController < ApplicationController

  def destroy
    VideoPhoto.find(params[:id]).destroy
    redirect_to(:back) 
  end

  def create
    @video = Video.find(params["video_id"].to_i)
    if params["video"]
      params["video"]["photo"].each do |photo_file|
        VideoPhoto.create(
          :video_id => @video.id,
          :photo => photo_file
          ).save!
      end
    end
    redirect_to(:back) 
  end 

end
