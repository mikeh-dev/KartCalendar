class ContactsController < ApplicationController
 
  def create
    if contact_form_valid?
      ContactMailer.contact_email(params[:name], params[:email], params[:message]).deliver_now
      redirect_to contact_path, notice: 'Message sent successfully'
    else
      render contact_path, status: :unprocessable_entity
    end
  end

  private

  def contact_form_valid?
    params[:name].present? && params[:email].present? && params[:message].present?
  end
end