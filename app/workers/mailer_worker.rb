class MailerWorker
  include Sidekiq::Worker

  # rubocop:disable Metrics/ParameterLists
  def perform(email, name, from, to, book, locale)
    RentMailer.new_rent(email, name, from, to, book, locale).deliver
  end
  # rubocop:enable Metrics/ParameterLists
end
