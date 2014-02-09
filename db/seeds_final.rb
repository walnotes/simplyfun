require 'csv'

lang_file = "public/csvs/languages.csv"
theme_file = "public/csvs/themes.csv"
subtheme_file = "public/csvs/subthemes.csv"
word_file = "public/csvs/words.csv"

# Create the languages
CSV.foreach(Rails.root.join(lang_file), headers: true) do |row|
	Language.create! name: row[0], name_english = row[1] etc...
end

CSV.foreach(Rails.root.join(theme_file), headers: true) do |row|
	Theme.create! name: row[], language_id: Language.find_by_name(row[])...
end

CSV.foreach(Rails.root.join(subtheme_file), headers: true) do |row|
	Subtheme.create! name: row[], subtheme_id: Subtheme.find_by_name(row[])...
end

CSV.foreach(Rails.root.join(word_file), headers: true) do |row|
	Theme.create! name: row[], subtheme_id: Subhtme.find_by_name(row[])...
end