
class EmailController < ApplicationController

  respond_to :json

  def create
    Contact.email_current_sessions(params[:email])
    respond_with Email.create!(params[:email])
  end
end
