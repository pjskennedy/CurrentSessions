class Email < ActiveRecord::Base

  attr_accessible :address, :body, :name
  
  validate :name,    :presence => true
  validates_length_of :name, :minimum => 1, :allow_nil => false, :message => "cannot be blank."
  validate :body,    :presence => true
  validates_length_of :body, :minimum => 1, :allow_nil => false, :message => "cannot be blank."

  validate :address, :presence => true
  validates_format_of :address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :message => "is not valid"

end
