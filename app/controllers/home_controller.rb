require 'open-uri'
require 'json'

class HomeController < ApplicationController
  def index
  end

  def upload
  end

  def sessions
    @videos = Video.all.select{|i| i.displayed and i.processed}.sort_by{|i| i.created_at.to_i}
  end

  def about
    # response = JSON.parse(open("https://api.twitter.com/1/statuses/user_timeline.json?screen_name=CurrentSesh&include_rts=true&include_entities=true&count=5").read)
    # @tweets = response.sort_by{|i| i["created_at"].to_i}.map{|i| {:time => i["created_at"], :text => i["text"] }}
  end

  def contact
  end

  def blog
  end

  def not_found
  end

end

