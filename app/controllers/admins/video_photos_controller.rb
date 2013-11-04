class Admins::VideoPhotosController < AdminsController
  
 def create

    @video_photo = VideoPhoto.new(params[:video_photo])

    respond_to do |format|
      if @video_photo.save
        format.html {
          render :json => [@video_photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@video_photo.to_jq_upload]}, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @video_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @video = Video.find(params[:video_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video.video_photos.map{|vp| vp.to_jq_upload } }
    end
  end

  def destroy
    @vphoto = VideoPhoto.find(params[:id])
    @vphoto.destroy

    respond_to do |format|
      format.html { redirect_to admins_video_video_photo_url }
      format.json { head :no_content }
    end
  end


end

