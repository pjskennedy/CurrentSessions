class Contact < ActionMailer::Base
  def email_current_sessions( params )
    @name  = params[:name]
    @email = params[:email]
    @body  = params[:body]
    mail(
      :from => @email,
      :to => "Current Sessions Productions <currentsessions@gmail.com>", 
      :subject => "Inquiries! - " + @name
    ).deliver
  end
end
