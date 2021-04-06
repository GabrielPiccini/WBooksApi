class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_rent(email, name, from, to, book)
    @name = name
    @from = from
    @to = to
    @book = book
    mail to: email, subject: 'New book rent!'
  end
end
