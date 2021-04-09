require 'rails_helper'

describe BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a book suggestion' do
      let!(:book_suggestion) { create(:book_suggestion) }

      subject do
        post :create
      end

      it 'responds with the book suggestion json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'When a guest creates a book suggestion' do
      let!(:book_suggestion) { create(:book_suggestion, user: nil) }

      subject do
        post :create
      end

      it 'responds with the book suggestion json' do
        expected = book_suggestion.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'When the title is nil' do
      let!(:book_suggestion) { build(:book_suggestion, title: nil) }

      subject do
        post :create
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When the author is nil' do
      let!(:book_suggestion) { build(:book_suggestion, author: nil) }

      subject do
        post :create
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When the link is nil' do
      let!(:book_suggestion) { build(:book_suggestion, link: nil) }

      subject do
        post :create
      end

      it 'responds with error' do
        expected = book_suggestion.errors.to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
