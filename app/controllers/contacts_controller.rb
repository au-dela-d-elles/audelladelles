class ContactsController < ApplicationController
    def create
        email = params[:email]
        subject = params[:subject]
        message = params[:message]
        puts email 
        puts subject
        puts message
        ContactMailer.send_contact_email(email, subject, message).deliver_now
        flash[:success] = "Your message has been sent!"
        redirect_to root_path
    end
end
  