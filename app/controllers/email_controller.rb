
class EmailController < ApplicationController

  respond_to :json

  def create
    @email = Email.create(params["email"])
    if @email.save
      Contact.email_current_sessions(params[:email][:name], params[:email][:address], params[:email][:body])
      render :json => @email.to_json, :status => :ok, :layout => false
    else
      render :json => {:errors => @email.errors.messages}, :status => 500, :layout => nil
    end
  end
end
