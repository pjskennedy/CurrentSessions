class Admins::VideoAudioFilesController < AdminsController

 def create

    @vaf = VideoAudioFile.new(params[:video_audio_file])

    respond_to do |format|
      if @vaf.save
        format.html {
          render :json => [@vaf.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@vaf.to_jq_upload]}, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @vaf.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @video = Video.find(params[:video_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video.video_audio_files.map{|vaf| vaf.to_jq_upload } }
    end
  end

  def destroy
    @vaf = VideoAudioFile.find(params[:id])
    @vaf.destroy

    respond_to do |format|
      format.html { redirect_to admins_video_video_audio_file_url }
      format.json { head :no_content }
    end
  end

end
