class AddIdentifierToTables < ActiveRecord::Migration
  def change
  	add_column :languages, :language_identifier, :string
  	add_column :themes, :theme_identifier, :string
  	add_column :subthemes, :subtheme_identifier, :string
  	add_column :words, :word_identifier, :string
  end
end
