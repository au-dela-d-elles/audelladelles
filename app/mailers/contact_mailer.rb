class ContactMailer < ApplicationMailer
    default from: 'hello@mathieustrosberg.com'
  
    def send_contact_email(email, subject, message)
        @email = email
        @subject = subject
        @message = message
        mail(to: email, subject: @subject, email: @email, message: @message)
    end
  end
