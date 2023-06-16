class ContactMailer < ApplicationMailer
    default to: 'audeladelles@gmail.com'
  
    def send_contact_email(email, subject, message)
        @email = email
        @subject = subject
        @message = message
        mail(from: email, subject: @subject, message: @message, email: @email)
    end
end
  