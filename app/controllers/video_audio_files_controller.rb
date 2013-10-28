class VideoAudioFilesController < ApplicationController

  def destroy
    VideoPhoto.find(params[:id]).destroy
    redirect_to(:back) 
  end

  def create
    @video = Video.find(params["video_id"].to_i)
    if params["video"]
      VideoAudioFile.create(params["video"]["audio_file"].map{|audio_file|
        {
          :video_id => @video.id,
          :audio_file => audio_file
        }
      })
    end
    redirect_to(:back) 
  end 

end
