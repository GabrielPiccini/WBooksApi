class MailerWorker
  include Sidekiq::Worker

  def perform(email, name, from, to, book, locale)
    RentMailer.new_rent(email, name, from, to, book, locale).deliver
  end
end
