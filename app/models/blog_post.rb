class BlogPost < ActiveRecord::Base
  attr_accessible :admin_id, :body, :image, :title
  belongs_to :admin

  has_attached_file :image, styles: {
    large:    '300x300>'
  },

  :default_style => :display,

  :storage => :s3,
  
  :s3_credentials => "#{Rails.root}/config/s3.yml"

  belongs_to :admin

end
