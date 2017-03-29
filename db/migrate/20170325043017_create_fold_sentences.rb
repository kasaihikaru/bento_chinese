class CreateFoldSentences < ActiveRecord::Migration
  def change
    create_table :fold_sentences do |t|
      t.references :fold, index: true, foreign_key: true
      t.references :sentence, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
