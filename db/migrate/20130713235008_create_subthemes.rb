class CreateSubthemes < ActiveRecord::Migration
  def change
    create_table :subthemes do |t|
      t.string :pdf_flashcards
      t.string :pdf_worksheet
      t.string :image
      t.string :name_english
      t.string :name
      t.integer :theme_id
      
      t.timestamps
    end
  end
end
