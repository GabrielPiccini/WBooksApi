class OpenLibraryService
  include HTTParty
  API_URL = Rails.application.secrets.apilibrary.freeze

  def execute(isbn)
    link = "#{API_URL}?bibkeys=#{isbn}&format=json&jscmd=data"
    response = HTTParty.get(link)
    [response.code, response.parsed_response]
  end
end
