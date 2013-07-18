require 'open-uri'
require 'json'

class HomeController < ApplicationController
  def index
  end

  def upload
  end

  def sessions
    # @videos = Video.all.select{|i| i.displayed and i.processed}.sort_by{|i| i.created_at.to_i}
  end

  def about
  end

  def contact
  end

  def blog
  end

  def not_found
  end

  def sessionpage 
    @video = Video.find_by_url_route(params[:name])
    redirect_to "/" if not @video.displayed
  end
end

