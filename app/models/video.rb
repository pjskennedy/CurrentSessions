class Video < ActiveRecord::Base
  attr_accessible :thumbnail_large, :thumbnail_medium, :thumbnail_small, :vimeo_id, :description, :title

end
