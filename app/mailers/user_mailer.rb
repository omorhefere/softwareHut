class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url  = :new_user_session
    mail(to: @user.email, subject: 'You account is waiting for approval')
  end

end
