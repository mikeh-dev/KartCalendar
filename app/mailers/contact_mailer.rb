class ContactMailer < ApplicationMailer
  default to: 'recipient@example.com', from: 'no-reply@example.com'

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail(to: default[:to], subject: 'New Contact Form Message')
  end
end
