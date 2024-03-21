class ContactMailer < ApplicationMailer
  default from: 'support@kartstream.co.uk'

  def contact_email(contact)
    @contact = contact
    mail(to: 'support@gmail.com', subject: 'New Contact Message')
  end

  def confirmation_email(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Thank you for contacting us')
  end
end
