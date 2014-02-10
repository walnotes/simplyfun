require 'csv'

lang_file = "public/csvs/languages.csv"
theme_file = "public/csvs/themes.csv"
subtheme_file = "public/csvs/subthemes.csv"
word_file = "public/csvs/words.csv"



# Create the languages
CSV.foreach(Rails.root.join(lang_file), headers: true) do |row|
	# CSV headers 		  name, name_english,language_id, theme_identifier
	Language.create! name: row[0], name_english: row[1]
end

CSV.foreach(Rails.root.join(theme_file), headers: true) do |row|
	# CSV Headers         name,name_english,image,pdf,language_id,subtheme_id,theme_name,theme_language
	# Model Attributes    :name, :name_english, :image, :pdf, :language_id, :description
	Theme.create! name: row[0], name_english: row[1], image: row[2], pdf: row[3], language_id: Language.find_by_language_identifier(row[4])
end

CSV.foreach(Rails.root.join(subtheme_file), headers: true) do |row|
	# CSV Headers         name,name_english,image,pdf_flashcards,pdf_worksheet,subtheme_id,theme_name,subtheme_name
	# Model Attributes    :image, :name, :name_english, :pdf_flashcards, :pdf_worksheet, :description, :video_url, :theme_id
	#Subtheme.create! name: row[], subtheme_id: Subtheme.find_by_name(row[])...
end

CSV.foreach(Rails.root.join(word_file), headers: true) do |row|
	# name,name_english,image,mp3,pdf,language,theme,subtheme,subtheme_id
	#Word.create! name: row[], subtheme_id: Subhtme.find_by_name(row[])...
end