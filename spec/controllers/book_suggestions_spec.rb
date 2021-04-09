require 'rails_helper'

describe BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a book suggestion' do
      let!(:book_suggestion) { build(:book_suggestion) }

      before do
        post :create, params: { book_suggestion:{ title: book_suggestion.title,
                                                  author: book_suggestion.author,
                                                  link: book_suggestion.link }  }
      end

      it 'responds with the book suggestion json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When a guest creates a book suggestion' do
      let!(:book_suggestion) { build(:book_suggestion, user: nil) }

      before do
        post :create, params: { book_suggestion:{ title: book_suggestion.title,
                                                  author: book_suggestion.author,
                                                  link: book_suggestion.link }  }
      end

      it 'responds with the book suggestion json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When the title is nil' do
      let!(:book_suggestion) { build(:book_suggestion) }

      before do
        post :create, params: { book_suggestion:{ title: nil,
                                                  author: book_suggestion.author,
                                                  link: book_suggestion.link }  }
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'When the author is nil' do
      let!(:book_suggestion) { build(:book_suggestion) }

      before do
        post :create, params: { book_suggestion:{ title: book_suggestion.title,
                                                  author: nil,
                                                  link: book_suggestion.link }  }
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'When the link is nil' do
      let!(:book_suggestion) { build(:book_suggestion) }

      before do
        post :create, params: { book_suggestion:{ title: book_suggestion.title,
                                                  author: book_suggestion.author,
                                                  link: nil }  }
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
