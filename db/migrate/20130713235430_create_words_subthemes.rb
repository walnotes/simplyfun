class CreateWordsSubthemes < ActiveRecord::Migration
  def change
    create_table :subthemes_words do |t|
      t.integer :word_id
      t.integer :subtheme_id
      t.string :word_english
      t.string :word_foreign
      t.string :word_foreign_image
      t.string :image
      t.string :pdf
      t.string :mp3

      t.timestamps
    end
  end
end
