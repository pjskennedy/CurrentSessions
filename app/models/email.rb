class Email < ActiveRecord::Base
  attr_accessible :address, :body, :name
end
