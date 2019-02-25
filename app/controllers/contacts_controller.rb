class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
   
  def create
    @contact = Contact.new(params[:contact]) 
    @contact.request = request
    if @contact.deliver #&& verify_recaptcha(model: @contact)   
      flah.now[:error] = nil
      #redirect_to root_path, notice: "Thank you for contacting us. We'll get back to you as soon as possible."
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end     
  end
end
