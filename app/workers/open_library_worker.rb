class OpenLibraryWorker
  include Sidekiq::Worker

  def perform(isbn)
    OpenLibraryService.book_info(isbn)
  end
end
