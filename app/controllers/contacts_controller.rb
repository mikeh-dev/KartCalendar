class ContactsController < ApplicationController
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.contact_email(@contact).deliver_now
      flash[:notice] = 'Message sent successfully'
      redirect_to new_contact_path
    else
      render :new
    end
  end

end
