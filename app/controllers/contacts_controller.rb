class ContactsController < ApplicationController

  def new
   @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params.merge(email: current_user.email, name: current_user.name))
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message,:nickname)
    end
end
