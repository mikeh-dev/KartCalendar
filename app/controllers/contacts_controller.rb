class ContactsController < ApplicationController
 
  def create
    if contact_form_valid?
      ContactMailer.contact_email(params[:name], params[:email], params[:message]).deliver_now
      redirect_to new_contact_path, notice: 'Message sent successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_form_valid?
    params[:name].present? && params[:email].present? && params[:message].present?
  end
end