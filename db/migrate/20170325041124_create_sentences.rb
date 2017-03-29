class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :ja
      t.text :ch
      t.text :pin
      t.integer :user_id
      t.integer :likes_count
      t.timestamps null: false
    end
  end
end
