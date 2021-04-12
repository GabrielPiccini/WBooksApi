class BookSuggestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :link, :user, :created_at

  def user
    object&.user&.attributes&.except('updated_at', 'created_at', 'password',
                                     'password_confirmation', 'reset_password_token',
                                     'reset_password_sent_at',
                                     'reset_password_sent_at', 'encrypted_password',
                                     'remember_created_at')
  end
end
