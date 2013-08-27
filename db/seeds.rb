#!/bin/env ruby
# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


spanish = Language.create! name_english: 'Spanish', name: 'Español'
city_theme = Theme.create! name: 'La Ciudad', name_english: 'The City', description: '', image: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/theme_image_city.jpg', pdf: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/theme_city_coloringbook.pdf', language_id: spanish.id
buildings_subtheme = Subtheme.create! name: 'Los Edificios', name_english: 'The Buildings', description: '', image: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_image/subtheme_image_buildings.jpg', pdf_flashcards: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_flashcards/subtheme_buildings_flashcards.pdf', pdf_worksheet: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_worksheets/subtheme_buildings_worksheets.pdf', video_url: '', theme_id: city_theme.id
Word.create! ([
	{ name: 'el apartamento', name_english: 'the apartment', image: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_images/images_buildings/apartment.jpg', mp3: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_audio/audio_buildings/Apartment%20single%20word%20Spanish.mp3', pdf: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_pdfs/pdfs_buildings/apartment_city_spanish.pdf', subtheme_id: buildings_subtheme.id },
	{ name: 'el banco', name_english: 'bank', image: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_images/images_buildings/bank.jpg', mp3: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_audio/audio_buildings/Bank%20single%20word%20Spanish.mp3', pdf: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_pdfs/pdfs_buildings/bank_city_spanish.pdf', subtheme_id: buildings_subtheme.id }
	])