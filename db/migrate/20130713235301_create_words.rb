class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name_english
      t.string :name
      t.string :name_image
      t.string :image
      t.string :mp3
      t.string :pdf

      t.timestamps
    end
  end
end
