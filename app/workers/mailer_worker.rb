class MailerWorker
  include Sidekiq::Worker

  def perform(rent_mail)
    RentMailer.new_rent(rent_mail).deliver
  end
end
