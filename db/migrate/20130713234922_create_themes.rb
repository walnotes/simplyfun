class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :image
      t.string :pdf
      t.string :name_english
      t.string :name
      t.integer :language_id
      
      t.timestamps
    end
  end
end
