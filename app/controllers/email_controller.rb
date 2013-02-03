
class EmailController < ApplicationController

  respond_to :json

  def create
    binding.pry
    Contact.email_current_sessions(params[:email][:name], params[:email][:address], params[:email][:body])
    respond_with Email.create!(params[:email])
  end
end
