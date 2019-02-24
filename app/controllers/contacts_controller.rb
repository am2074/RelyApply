class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end

    def new
      @contact = Contact.new
    end
   
    def create
      @contact = Contact.new(contact_params)
      if @contact.valid?
      MessageMailer.contact(@contact).deliver_now
      redirect_to root_path
      flash[:notice] = "We have received your message and will be in touch soon!"
    else
      flash[:notice] = "There was an error sending your message. Please try again."
      render :new
    end
      #@contact.request = request
        #if @contact.valid? && verify_recaptcha(model: @contact)   
          #@contact.deliver_later
          #redirect_to root_path, notice: "Thank you for contacting us. We'll get back to you as soon as possible."
        #else
          #flash.now[:error] = 'Cannot send message.'
          #render :new
        #end     
    end
  private
 def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end
end
