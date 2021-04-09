class CreateBookSuggestions < ActiveRecord::Migration[5.2]
  def up
    if !table_exists?(:book_suggestions)
      create_table :book_suggestions do |t|
        t.string :editorial
        t.float :price
        t.string :author
        t.string :title
        t.string :link
        t.string :publisher
        t.string :year
        t.references :user, foreign_key: true
  
        t.timestamps
      end
    end
  end

  def down
    drop_table :book_suggestions if table_exists?(:book_suggestions)
  end
end
