class HomeController < ApplicationController
  def index
  end

  def upload
    file_path = File.expand_path(params["file_loc"].as_json["tempfile"])
    upload = Vimeo::Advanced::Upload.new("8b1856df9752bb3ff26f0a90a045834da678cff1", "946a7b18a5ca1c6decc03217ec6039e8557279b4", :token => "8697d319dcdb2e887c2677d148f4e2f3", :secret => "d916d3d2b1df25f7a72aa609159ba82492e36cc7")
    upload.upload(file_path)
    binding.pry
  end
end
