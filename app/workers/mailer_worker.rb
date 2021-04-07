class MailerWorker
  include Sidekiq::Worker

  def perform(email, name, from, to, book)
    RentMailer.new_rent(email, name, from, to, book).deliver
  end
end
