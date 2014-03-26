class ContactMailer < ActionMailer::Base
  default from: "gasydspammer@gmail.com"

def contact_email(from_user, message)
    @from_user = from_user
    @message = message
    mail(to: 'jturnbull@ga.co', subject: 'Contact Submission')
  end
end

