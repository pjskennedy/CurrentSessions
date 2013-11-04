class AdminsController < ApplicationController
  
  layout "admin"
  before_filter :authenticate_admin!  
  before_filter :check_if_approved

  def check_if_approved
    unless current_admin.approved
      sign_out current_admin
      redirect_to :not_verified
    end
  end

  def mainpage
  end

end


