class ContactMailer < ActionMailer::Base
  default from: "app26027115@heroku.com"

  def contact(subject, from_email, from_name, message)
  	#subject = params[:subject]
  	#from_email = params[:from_email]
  	#from_name = params[:from_name]
  	#message = params[:message]

  	mail(to: "stub6225@gmail.com", reply_to: from_email, subject: subject, body: message + "\n\n-" + from_name)
  end
end
