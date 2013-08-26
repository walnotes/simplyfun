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
trip_theme = Theme.create! name: 'The Trip', name_english: 'El Viaje', description: 'Going on Vacation!', image: 'http://fivesomnimedia.com/projects/sfs/theme/img/theme_image_the_trip.jpg', language_id: spanish.id
hotel_subtheme = Subtheme.create! name: 'The Hotel', description: 'Where you sleep when on a trip', image: 'http://fivesomnimedia.com/projects/sfs/theme/img/hotel.jpg', video_url: 'https://vimeo.com/61150433', theme_id: trip_theme.id
Word.create! ([
	{ name_english: 'bathroom', subtheme_id: hotel_subtheme.id },
	{ name_english: 'bed', subtheme_id: hotel_subtheme.id }
	])