class CreateRents < ActiveRecord::Migration[5.2]
  def up
    if !table_exists?(:rents)
      create_table :rents do |t|
        t.references :user, foreign_key: true
        t.references :book, foreign_key: true
        t.date :from
        t.date :to
  
        t.timestamps
      end
    end
  end

  def down
    drop_table :rents if table_exists?(:rents)
  end
end

