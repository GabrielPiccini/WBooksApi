class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_rent(email, name, from, to, book, locale)
    I18n.with_locale(locale) do
      @name = name
      @from = from
      @to = to
      @book = book
      mail(to: email, subject: I18n.t(:subject))
    end
  end
end
