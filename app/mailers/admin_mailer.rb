class AdminMailer < ApplicationMailer
  def new_user_waiting_for_approval(user)
    @user = user
    mail(to: 'sheffieldwatercentre@gmail.com', subject: 'Registration Request')
  end
end
