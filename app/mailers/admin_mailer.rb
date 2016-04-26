class AdminMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url  = :new_user_session
    mail(to: @user.email, subject: 'You account is waiting for approval')
  end

  def new_user_waiting_for_approval(user)
    mail(to: 'ooimoloame1@sheffield.ac.uk', subject: 'Registration Request')
  end
end
