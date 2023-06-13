class UserMailer < ApplicationMailer
    default from: 'no-reply@audeladelles.fr'
    # default from: ENV['MAILJET_NOREPLY_FROM']
    # default from: ENV['MAILJET_CONTACT_FROM']

    def welcome_email(user)
        @user = user 
        @url  = 'http://monsite.fr/login' 
        mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end

end
