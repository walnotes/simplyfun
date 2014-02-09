#!/bin/env ruby
# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all	
User.create! ([{ email: 'apchait@gmail.com', password: 'password', password_confirmation: 'password'}, 
  {email: 'walterchkoning@yahoo.com', password: 'password', password_confirmation: 'password'}, 
  {email: 'guest@sfslanguages.com', password: 'sfsonline', password_confirmation: 'sfsonline'}, 
  {email: 'schartowm@sfslanguages.com', password: 'password', password_confirmation: 'password'}])

# Delete the contents of the Language, Theme and Subtheme tables
Language.delete_all
Theme.delete_all
Subtheme.delete_all
Word.delete_all


# Loop through the languages and create the themes, subthemes, and words for each.
languages = [
  ['spanish','Spanish', 'Español'],
  ['french', 'French', 'Français'],
  ['vietnamese', 'Vietnamese', 'Việt']
  ]

theme_list = [
  ['city', 'La Ciudad', 'The City', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/theme_image_city.jpg', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/theme_city_coloringbook.pdf', 'spanish', 'city_spanish'],
  ['house', 'La Casa', 'House', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_house/theme_image_house.jpg', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_house/theme_house_coloringbook.pdf', 'spanish', 'house_spanish']
  ]

subtheme_list = [
  ['la calle', 'The Street', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_image/subtheme_image_street.jpg', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_flashcards/subtheme_street_flashcards.pdf', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_worksheets/subtheme_street_worksheets.pdf', 'spanish', 'city_spanish', 'street'],
  ['los edificios', 'The Buildings', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_image/subtheme_image_buildings.jpg', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_flashcards/subtheme_buildings_flashcards.pdf', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_worksheets/subtheme_buildings_worksheets.pdf', 'spanish', 'city_spanish', 'buildings']
  ]
  
word_list = [
  ['el semáforo', 'the traffic light', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_images/images_street/traffic_light.jpg', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_audio/audio_street/traffic_light.mp3', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_pdfs/pdfs_street/traffic_light_city_spanish.pdf', 'spanish', 'city_spanish', 'street'],
  ['la intersección', 'the intersection', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_images/images_street/intersection.jpg', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_audio/audio_street/intersection.mp3', 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_pdfs/pdfs_street/intersection_city_spanish.pdf', 'spanish', 'city_spanish', 'street']
  ]

# Create an entry for each language
languages.each do |lang|
	language = Language.create! name_english: lang[1], name: lang[2]
#	language = Language.create! name_english: lang[1], name: lang[2], language_identifier: lang[0]

  # TODO: theme_list = Only lines for the themes in the current language (ie. all spanish themes)
  # Create an entry for each theme for the current language
  theme_list.each do |t|
    theme = Theme.create! name: t[1], name_english: t[2], image: t[3], pdf: t[4]
#    theme = Theme.create! name: t[1], name_english: t[2], image: t[3], pdf: t[4], language_identifier: t[5], theme_identifier: t[6]
#      language_id: Language.find_by_language_identifier(t[5]).id
    
    # TODO: subtheme = Only lines for subthemes in the current theme in the current language (ie. all subthemes for city in spanish)
    # Create an entry for each subtheme for the current theme
    subtheme_list.each do |s|
    	subtheme = Subtheme.create! name: s[0], name_english: s[1], image: s[2], pdf_flashcards: s[3], pdf_worksheet: s[4]
#    	subtheme = Subtheme.create! name: s[0], name_english: s[1], image: s[2], pdf_flashcards: s[3], pdf_worksheet: s[4], language_identifier: s[5], theme_identifier: s[6], subtheme_identifier: s[7]
#      	theme_id: Theme.find_by_theme_identifer(s[6]).id

      # TODO: subtheme = Only lines for words in subthemes in the current theme in the current language (ie. all words in street for city in spanish)
      # Create an entry for each word in the current subtheme
      word_list.each do |w|
      	word = Word.create! name: w[0], name_english: w[1], image: w[2], mp3: w[3], pdf: w[4]
#      	word = Word.create! name: w[0], name_english: w[1], image: w[2], mp3: w[3], pdf: w[4], language_identifier: w[5], theme_identifier: w[6], subtheme_identifier: w[7]
#        	subtheme_id: Subtheme.find_by_subtheme_identifier(w[7]).id
      end #end word
    end #end subtheme
  end #end theme
end #end language
