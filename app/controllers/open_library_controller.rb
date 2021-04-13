class OpenLibraryController < ApiController
  include AsyncRequest::ApplicationHelper

  def index
    id = execute_async(OpenLibraryService, params[:bibkeys])
    render json: { id: id, url: async_request.job_url(id) }, status: :accepted
  end
end
