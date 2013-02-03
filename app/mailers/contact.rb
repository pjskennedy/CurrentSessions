class Contact < ActionMailer::Base
  def email_current_sessions( name, email, body )
    @name  = name
    @email = email
    @body  = body
    mail(
      :from => @email,
      :to => "Current Sessions Productions <currentsessions@gmail.com>", 
      :subject => "Inquiries! - " + @name
    ).deliver
  end
end
