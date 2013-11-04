class EmailsController < ApplicationController

  def create
    @email = Email.new(params[:email])
    respond_to do |format|
      if @email.save
        format.html {
          render :json => @email.to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: @email.to_json, status: :created }
      else
        format.html { render action: "contact", controller: "home" }
        format.json { render json: @email.errors.to_json, status: :unprocessable_entity }
      end
    end
  end

end


