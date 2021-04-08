class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_rent(rent_mail)
    I18n.with_locale(rent_mail['locale']) do
      @name = rent_mail['name']
      @from = rent_mail['from']
      @to = rent_mail['to']
      @book = rent_mail['book']
      mail(to: rent_mail['email'], subject: I18n.t(:subject))
    end
  end
end
