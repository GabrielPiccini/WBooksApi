class OpenLibraryService
  include HTTParty

  def execute(isbn)
    link = "#{Rails.application.secrets.apilibrary + isbn}&format=json&jscmd=data"
    response = HTTParty.get(link)
    [response.code, response.parsed_response]
  end
end
