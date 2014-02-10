require 'csv'

lang_file = "public/csvs/languages.csv"
theme_file = "public/csvs/themes.csv"
subtheme_file = "public/csvs/subthemes.csv"
word_file = "public/csvs/words.csv"


# Model attributes are mapped to row[column] so if the csv has name in column 0, you set name: row[0], etc...
# For lookups, set language_id: Language.find_by_language_identifier(row[x]), same for themes and subthems lookup
# Make sure all the model attributes are accounted for, doesn't matter if there are extra csv headers

CSV.foreach(Rails.root.join(lang_file), headers: true) do |row|
	# CSV headers 		  name,name_english,language_id,theme_identifier
	# Model Attributes    :description, :name, :name_english, :language_identifier
	Language.create! name: row[0], name_english: row[1], language_identifier: row[3]]
end

CSV.foreach(Rails.root.join(theme_file), headers: true) do |row|
	# CSV Headers         name, name_english, image, pdf, language, theme
	# Model Attributes    :name, :name_english, :image, :pdf, :language_id, :description
	Theme.create! name: row[0], name_english: row[1], image: row[2], pdf: row[3], language_id: Language.find_by_language_identifier(row[4]), theme_identifier: row[5]
end

CSV.foreach(Rails.root.join(subtheme_file), headers: true) do |row|
	# CSV Headers   	  name,name_english,image,pdf_flashcards,pdf_worksheet,language,theme,subtheme,subtheme_no_language      
	# Model Attributes    :image, :name, :name_english, :pdf_flashcards, :pdf_worksheet, :description, :video_url, :theme_id, :subtheme_identifier
	Subtheme.create! name: row[0], name_english = row[1], image: row[2], pdf_flashcards: row[3], pdf_worksheet: row[4], theme_id: Theme.find_by_theme_identifier(row[6]), subtheme_identifier: row[7]
end

CSV.foreach(Rails.root.join(word_file), headers: true) do |row|
	# CSV Headers        name,name_english,image,mp3,pdf,language,theme,subtheme,subtheme_no_language
	# Model Attributes   :image, :mp3, :name, :name_english, :name_image, :pdf, :subtheme_id, :word_identifier
	Word.create! name: row[0], name_english: row[1], image: row[2], mp3: row[3], pdf: row[4], subtheme_id: Subtheme.find_by_subtheme_identifier(row[7])
end