class HomeController < ApplicationController
  def index
  end

  def upload
    file_path = File.expand_path(params["file_loc"].as_json["tempfile"])
    upload = Vimeo::Advanced::Upload.new("8b1856df9752bb3ff26f0a90a045834da678cff1", "946a7b18a5ca1c6decc03217ec6039e8557279b4", :token => "https://vimeo.com/oauth/request_token", :secret => "https://vimeo.com/oauth/authorize")
    upload.upload(file_path)
    binding.pry
  end
end
