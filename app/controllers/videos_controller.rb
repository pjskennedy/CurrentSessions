class VideosController < ApplicationController

  def index
    @videos = Video.sorted_by_order.select{|i| i.displayed}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos.to_json }
    end

  end

  def show
    @video = Video.find_by_url_route(params[:url_route])
  end

end


