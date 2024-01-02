class ContactMailer < ApplicationMailer
  default from: 'info@kartstream.co.uk'

  def contact_email(contact)
    @contact = contact
    mail(to: 'mhlejhjhgh@gmail.com', subject: 'New Contact Form Message')
  end
end
