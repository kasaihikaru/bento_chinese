class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :ja
      t.text :ch
      t.text :pin
      t.integer :sentence_id
      t.timestamps null: false
    end
  end
end
