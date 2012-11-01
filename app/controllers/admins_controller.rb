class AdminsController < ApplicationController

  before_filter :authenticate_admin!

  respond_to :json

  def show
    respond_with Admin.all.as_json
  end

  def find
    respond_with current_admin.as_json
  end

  def index
  end

  def exit
    sign_out @admin
    redirect_to :controller => "home", :action => "index",
  end
end
