class BookSuggestionsController < ApiController
  def create
    all_params = suggestions_params.merge(user: current_user)
    @book_suggestion = BookSuggestion.create(all_params)
    return render json: @book_suggestion, status: :created  if @book_suggestion.save

    render json: @book_suggestion.errors, status: :unprocessable_entity
  end

  private

  def suggestions_params
    params.require(:book_suggestion).permit(:title, :author, :link,
                                            :editorial, :price, :publisher,
                                            :year)
  end
end
