class VideosController < ApplicationController

  respond_to :json

  def refresh
    msg = ""
    if admin_signed_in? and current_admin.approved?
      Video.update 
    end
    redirect_to :back 
  end

  def index
    if params[:url_route]
      respond_with Video.find_by_url_route(params[:url_route]).as_json
    else
      respond_with Video.where(:displayed => true, :processed => true ).sort_by{|i| i.created_at.to_i}.as_json
    end
  end

  def update 
    if admin_signed_in? and current_admin.approved?
      @video = Video.find(params[:id].to_i)
      @video.update_attributes(params[:video])
      @video.sync_video_with_vimeo if params[:dirty]
      redirect_to "/admin"
    else
      redirect_to :back
    end
  end

  def delete

    if admin_signed_in? and current_admin.approved?
      Video.find(params["id"]).destroy
      redirect_to "/admin"
    else
      redirect_to "/admin"
    end
  end

end

