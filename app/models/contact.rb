class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject
  attribute :message
  attribute :nickname, :captcha => true

#  def headers
#    {
#      :subject => "Message From User",
#      :from => %("#{name}" <#{email}>)
#    }
#  end
end
