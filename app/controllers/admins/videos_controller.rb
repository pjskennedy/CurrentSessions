class Admins::VideosController < AdminsController

  def index  
    if params[:query]
      @sources = Video.find(:all, :conditions => 
        ['lower(title) LIKE ?', "%#{params[:query].downcase}%"])
      render :json => @sources.as_json(:tt => true), :status => :ok, :layout => nil
    end
  
  end

  def edit
    @video = Video.find(params[:id])
  end


  def video_photos
    @video = Video.find(params[:video_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video.video_photos.map{|upload| upload.to_jq_upload } }
    end
  end

  def show
    @video = Video.find(params["id"])
  end

  def update
    Video.find(params["id"]).update_attributes(params["video"])
    redirect_to :back
  end

  def refresh
    Video.refresh 
    redirect_to :back 
  end

  def ordering
    order_table = Hash[params[:ordering].each_with_index.map { |video_id, index|
      [video_id, {:order => index + 1}]
    }]
    Video.update(order_table.keys, order_table.values)

    render :json => {:data => true, :status => :success}

  end
end


