#!/bin/env ruby
# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Language.delete_all
spanish = Language.create! name_english: 'Spanish', name: 'Español'
# city_theme = Theme.create! name: 'La Ciudad', name_english: 'The City', description: '', image: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/theme_image_city.jpg', pdf: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/theme_city_coloringbook.pdf', language_id: spanish.id
# buildings_subtheme = Subtheme.create! name: 'Los Edificios', name_english: 'The Buildings', description: '', image: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_image/subtheme_image_buildings.jpg', pdf_flashcards: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_flashcards/subtheme_buildings_flashcards.pdf', pdf_worksheet: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_worksheets/subtheme_buildings_worksheets.pdf', video_url: '', theme_id: city_theme.id
# Word.create! ([
# 	{ name: 'el apartamento', name_english: 'apartment', image: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_images/images_buildings/apartment.jpg', mp3: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_audio/audio_buildings/Apartment%20single%20word%20Spanish.mp3', pdf: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_pdfs/pdfs_buildings/apartment_city_spanish.pdf', subtheme_id: buildings_subtheme.id },
# 	{ name: 'el banco', name_english: 'bank', image: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_images/images_buildings/bank.jpg', mp3: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_audio/audio_buildings/Bank%20single%20word%20Spanish.mp3', pdf: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/word_pdfs/pdfs_buildings/bank_city_spanish.pdf', subtheme_id: buildings_subtheme.id }
# 	])

User.delete_all	
User.create! ([{ email: 'apchait@gmail.com', password: 'password', password_confirmation: 'password'}, {email: 'walterchkoning@yahoo.com', password: 'password', password_confirmation: 'password'}, {email: 'schartowm@sfslanguages.com', password: 'password', password_confirmation: 'password'}])



# city_theme = Theme.create! name: 'La Ciudad', name_english: 'The City', image: server_prefix + 'theme_city/theme_image_city.jpg', pdf: server_prefix + 'theme_city/theme_city_coloringbook.pdf', language_id: spanish.id
# buildings_subtheme = Subtheme.create! name: 'Los Edificios', name_english: 'The Buildings', image: server_prefix + 'theme_city/subtheme/subtheme_image/subtheme_image_buildings.jpg', pdf_flashcards: server_prefix + 'theme_city/subtheme/subtheme_flashcards/subtheme_buildings_flashcards.pdf', pdf_worksheet: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_worksheets/subtheme_buildings_worksheets.pdf', video_url: '', theme_id: city_theme.id
# car_subtheme = Subtheme.create! name: 'El Coche', name_english: 'The Car', image: server_prefix + 'theme_city/subtheme/subtheme_image/subtheme_image_car.jpg', pdf_flashcards: server_prefix + 'theme_city/subtheme/subtheme_flashcards/subtheme_car_flashcards.pdf', pdf_worksheet: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_worksheets/subtheme_car_worksheets.pdf', video_url: '', theme_id: city_theme.id
# street_subtheme = Subtheme.create! name: 'Los Edificios', name_english: 'The Buildings', image: server_prefix + 'theme_city/subtheme/subtheme_image/subtheme_image_buildings.jpg', pdf_flashcards: server_prefix + 'theme_city/subtheme/subtheme_flashcards/subtheme_buildings_flashcards.pdf', pdf_worksheet: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_worksheets/subtheme_buildings_worksheets.pdf', video_url: '', theme_id: city_theme.id
# transportation_subtheme = Subtheme.create! name: 'Los Edificios', name_english: 'The Buildings', image: server_prefix + 'theme_city/subtheme/subtheme_image/subtheme_image_buildings.jpg', pdf_flashcards: server_prefix + 'theme_city/subtheme/subtheme_flashcards/subtheme_buildings_flashcards.pdf', pdf_worksheet: 'http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/theme_city/subtheme/subtheme_worksheets/subtheme_buildings_worksheets.pdf', video_url: '', theme_id: city_theme.id

server_prefix = "http://fivesomnimedia.com/projects/sfs/sfs_site_spanish/"
Theme.delete_all
Subtheme.delete_all

# Create the theme
city_theme = Theme.create! name: 'La Ciudad', name_english: 'The City', image: server_prefix + 'theme_city/theme_image_city.jpg', pdf: server_prefix + 'theme_city/theme_city_coloringbook.pdf', language_id: spanish.id
# Create an array of arrays of the subtheme
subthemes = [['The Buildings', 'Los Edificios', 'buildings'], ['The Car', 'El Coche', 'car'], ['The Street', 'La Calle', 'street'], ['The Transportation', 'La Transportación', 'transportation']]
# Create the subthemes
subthemes.each do |s|
	name_english = s[0]
	filename = s[2]
	name = s[1]
	subtheme = Subtheme.create! name: name, 
	name_english: name_english, 
	image: server_prefix + 'theme_city/subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
	pdf_flashcards: server_prefix + 'theme_city/subtheme/subtheme_flashcards/subtheme_' + filename + '_flashcards.pdf', 
	pdf_worksheet: server_prefix + 'theme_city/subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
	theme_id: city_theme.id
end


# Create the theme
house_theme = Theme.create! name: 'La Casa', name_english: 'House', image: server_prefix + 'theme_house/theme_image_house.jpg', pdf: server_prefix + 'theme_house/theme_house_coloringbook.pdf', language_id: spanish.id
# Create an array of arrays of the subtheme
subthemes = [['The Bathroom', 'El Baño', 'bathroom'], ['The Bedroom', 'La Habitacíon', 'bedroom'], ['The Kitchen', 'La Cocina', 'kitchen'], ['The Living Room', 'La Sala', 'living room']]
# Create the subthemes
subthemes.each do |s|
	name_english = s[0]
	filename = s[2].tr(" ", "_")
	name = s[1]
	subtheme = Subtheme.create! name: name, 
	name_english: name_english, 
	image: server_prefix + 'theme_house/subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
	pdf_flashcards: server_prefix + 'theme_house/subtheme/subtheme_flashcards/subtheme_' + filename + '_flashcards.pdf', 
	pdf_worksheet: server_prefix + 'theme_house/subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
	theme_id: house_theme.id
end

# Create the theme
school_theme = Theme.create! name: 'La Escuela', name_english: 'School', image: server_prefix + 'theme_school/theme_image_school.jpg', pdf: server_prefix + 'theme_school/theme_school_coloringbook.pdf', language_id: spanish.id
# Create an array of arrays of the subtheme
subthemes = [['The Backpack', 'La Mochila', 'backpack'], ['The Lesson', 'La Lección', 'lesson'], ['The School', 'La Escuela', 'school'], ['Subjects', 'Las Materias', 'subjects']]
# Create the subthemes
subthemes.each do |s|
	name_english = s[0]
	filename = s[2]
	name = s[1]
	subtheme = Subtheme.create! name: name, 
	name_english: name_english, 
	image: server_prefix + 'theme_school/subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
	pdf_flashcards: server_prefix + 'theme_school/subtheme/subtheme_flashcards/subtheme_' + filename + '_flashcards.pdf', 
	pdf_worksheet: server_prefix + 'theme_school/subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
	theme_id: school_theme.id
end

# Create the theme
the_trip_theme = Theme.create! name: 'El Viaje', name_english: 'The Trip', image: server_prefix + 'theme_the_trip/theme_image_the_trip.jpg', pdf: server_prefix + 'theme_the_trip/theme_the_trip_coloringbook.pdf', language_id: spanish.id
# Create an array of arrays of the subtheme
subthemes = [['The Airport', 'El Aeropuerto', 'airport'], ['The Beach', 'La Playa', 'beach'], ['The Hotel', 'El Hotel', 'hotel'], ['The Trip', 'El Viaje', 'trip']]
# Create the subthemes
subthemes.each do |s|
	name_english = s[0]
	filename = s[2]
	name = s[1]
	subtheme = Subtheme.create! name: name, 
	name_english: name_english, 
	image: server_prefix + 'theme_the_trip/subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
	pdf_flashcards: server_prefix + 'theme_the_trip/subtheme/subtheme_flashcards/subtheme_' + filename + '_flashcards.pdf', 
	pdf_worksheet: server_prefix + 'theme_the_trip/subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
	theme_id: the_trip_theme.id
end





Word.delete_all
words = [['City', 'The Street', 'traffic light', 'el semáforo'],
['City', 'The Street', 'intersection', 'la intersección'],
['City', 'The Street', 'sign', 'el letrero'],
['City', 'The Street', 'sidewalk', 'la acera'],
['City', 'The Street', 'city', 'la ciudad'],
['City', 'The Street', 'mailbox', 'el buzón'],
['City', 'The Street', 'bridge', 'el puente'],
['City', 'The Street', 'pedestrian', 'el peatón'],
['City', 'The Street', 'river', 'el río'],
['City', 'The Street', 'street', 'la calle'],
['City', 'The Street', 'watch out careful', '¡Cuidado!'],
['City', 'The Street', 'to walk', 'caminar'],
['City', 'The Street', 'to wait for', 'esperar'],
['City', 'The Street', 'to be careful', 'tener cuidado'],
['City', 'The Buildings', 'museum', 'el museo'],
['City', 'The Buildings', 'hospital', 'el hospital'],
['City', 'The Buildings', 'park', 'el parque'],
['City', 'The Buildings', 'school', 'la escuela'],
['City', 'The Buildings', 'movie theater', 'el cine'],
['City', 'The Buildings', 'mall', 'el centro comercial'],
['City', 'The Buildings', 'restaurant', 'el restaurante'],
['City', 'The Buildings', 'apartment', 'el apartamento'],
['City', 'The Buildings', 'buildings', 'los edificios'],
['City', 'The Buildings', 'post office', 'el correo'],
['City', 'The Buildings', 'bank', 'el banco'],
['City', 'The Buildings', 'to work', 'trabajar'],
['City', 'The Buildings', 'to buy', 'comprar'],
['City', 'The Buildings', 'to look for', 'buscar'],
['City', 'The Transportation', 'bus', 'el autobús'],
['City', 'The Transportation', 'transportation', 'la transportación'],
['City', 'The Transportation', 'bus station', 'la estación autobús'],
['City', 'The Transportation', 'plane', 'el avión'],
['City', 'The Transportation', 'taxi', 'el taxi'],
['City', 'The Transportation', 'traffic', 'el tráfico'],
['City', 'The Transportation', 'train', 'el tren'],
['City', 'The Transportation', 'bicycle', 'la bicicleta'],
['City', 'The Transportation', 'motorcycle', 'la motocicleta'],
['City', 'The Transportation', 'to ride', 'montar'],
['City', 'The Transportation', 'to cross', 'cruzar'],
['City', 'The Transportation', 'to get on the bus', 'subir al autobús'],
['City', 'The Transportation', 'to get off the bus', 'bajar del autobús'],
['City', 'The Car', 'car', 'el coche'],
['City', 'The Car', 'horn', 'el claxon'],
['City', 'The Car', 'mirror', 'el espejo'],
['City', 'The Car', 'seat belt', 'el cinturón de seguridad'],
['City', 'The Car', 'seat', 'el asiento'],
['City', 'The Car', 'wheel', 'la rueda'],
['City', 'The Car', 'driver boy', 'el conductor'],
['City', 'The Car', 'driver girl', 'la conductora'],
['City', 'The Car', 'to go', 'ir'],
['City', 'The Car', 'to drive', 'manejar'],
['City', 'The Car', 'to crash', 'chocar'],
['City', 'The Car', 'to go fast', 'ir rápido'],
['City', 'The Car', 'to go slowly', 'ir despacio'],
['City', 'The Car', 'to the left', 'a la izquierda'],
['City', 'The Car', 'to the right', 'a la derecha'],
# ['The City', 'Verbs', 'to walk', 'caminar'],
# ['The City', 'Verbs', 'to wait for', 'esperar'],
# ['The City', 'Verbs', 'to be careful', 'tener cuidado'],
# ['The City', 'Verbs', 'to work', 'trabajar'],
# ['The City', 'Verbs', 'to buy', 'comprar'],
# ['The City', 'Verbs', 'to look for', 'buscar'],
# ['The City', 'Verbs', 'to ride', 'montar'],
# ['The City', 'Verbs', 'to cross', 'cruzar'],
# ['The City', 'Verbs', 'to get on the bus', 'subir al autobús'],
# ['The City', 'Verbs', 'to get off the bus', 'bajar del autobús'],
# ['The City', 'Verbs', 'to go', 'ir'],
# ['The City', 'Verbs', 'to drive', 'manejar'],
# ['The City', 'Verbs', 'to crash', 'chocar'],
# ['The City', 'Verbs', 'to go fast', 'ir rápido'],
# ['The City', 'Verbs', 'to go slowly', 'ir despacio'],
# ['The City', 'Verbs', 'to the left', 'a la izquierda'],
# ['The City', 'Verbs', 'to the right', 'a la derecha'],
['House', 'The Living Room', 'fireplace', 'la chimenea'],
['House', 'The Living Room', 'staircase', 'la escalera'],
['House', 'The Living Room', 'telephone', 'el teléfono'],
['House', 'The Living Room', 'couch', 'el sofá'],
['House', 'The Living Room', 'lamp', 'la lámpara'],
['House', 'The Living Room', 'window', 'la ventana'],
['House', 'The Living Room', 'house', 'la casa'],
['House', 'The Living Room', 'living room', 'la sala'],
['House', 'The Living Room', 'rug', 'la alfombra'],
['House', 'The Living Room', 'television set', 'el televisor'],
['House', 'The Living Room', 'remote', 'el remoto'],
['House', 'The Bedroom', 'closet', 'el armario'],
['House', 'The Bedroom', 'clock', 'el reloj'],
['House', 'The Bedroom', 'pillow', 'la almohada'],
['House', 'The Bedroom', 'bed', 'la cama'],
['House', 'The Bedroom', 'bedroom', 'la habitacíon'],
['House', 'The Bedroom', 'hanger', 'la percha'],
['House', 'The Bedroom', 'blanket', 'la manta'],
['House', 'The Bedroom', 'dresser', 'la cómoda'],
['House', 'The Bedroom', 'door', 'la puerta'],
['House', 'The Bedroom', 'radio', 'la radio'],
['House', 'The Kitchen', 'frying pan', 'la sartén'],
['House', 'The Kitchen', 'kitchen', 'la cocina'],
['House', 'The Kitchen', 'dishwasher', 'el lavaplatos'],
['House', 'The Kitchen', 'oven', 'el horno'],
['House', 'The Kitchen', 'microwave', 'el horno microondas'],
['House', 'The Kitchen', 'stove', 'la estufa'],
['House', 'The Kitchen', 'toaster', 'el tostador'],
['House', 'The Kitchen', 'table', 'la mesa'],
['House', 'The Kitchen', 'chair', 'la silla'],
['House', 'The Kitchen', 'trash can', 'el basurero'],
['House', 'The Kitchen', 'refrigerator', 'el refrigerador'],
['House', 'The Bathroom', 'bathroom', 'el baño'],
['House', 'The Bathroom', 'shampoo', 'el champú'],
['House', 'The Bathroom', 'soap', 'el jabón'],
['House', 'The Bathroom', 'toothpaste', 'la pasta de dientes'],
['House', 'The Bathroom', 'toothbrush', 'el cepillo de dientes'],
['House', 'The Bathroom', 'shower', 'la ducha'],
['House', 'The Bathroom', 'sink', 'el lavamanos'],
['House', 'The Bathroom', 'towel', 'la toalla'],
['House', 'The Bathroom', 'toilet', 'el excusado'],
['House', 'The Bathroom', 'bathtub', 'la bañadera'],
# ['The House', 'Verbs', 'to look at', 'mirar'],
# ['The House', 'Verbs', 'to sit down', 'sentarse'],
# ['The House', 'Verbs', 'to get up', 'levantarse'],
# ['The House', 'Verbs', 'to put', 'poner'],
# ['The House', 'Verbs', 'to jump', 'saltar'],
# ['The House', 'Verbs', 'to turn around', 'dar vueltas'],
# ['The House', 'Verbs', 'to dance', 'bailar'],
# ['The House', 'Verbs', 'to go to bed', 'acostarse'],
# ['The House', 'Verbs', 'to wake up', 'despertarse'],
# ['The House', 'Verbs', 'to grab', 'agarrar'],
# ['The House', 'Verbs', 'to dry off', 'secarse'],
# ['The House', 'Verbs', 'to touch', 'tocar'],
# ['The House', 'Verbs', 'to sing', 'cantar'],
['School', 'The School', 'classroom', 'el aula'],
['School', 'The School', 'library', 'la biblioteca'],
['School', 'The School', 'cafeteria', 'la cafetería'],
['School', 'The School', 'gym', 'el gimnasio'],
['School', 'The School', 'school', 'la escuela'],
['School', 'The School', 'teacher boy', 'el maestro'],
['School', 'The School', 'teacher girl', 'la maestra'],
['School', 'The School', 'student boy', 'el estudiante'],
['School', 'The School', 'student girl', 'la estudiante'],
['School', 'The School', 'playground', 'el patio de recreo'],
['School', 'The School', 'swing', 'el columpio'],
['School', 'The School', 'to ask a question', 'hacer una pregunta'],
['School', 'The School', 'to answer', 'contestar'],
['School', 'The School', 'to eat lunch', 'almorzar'],
['School', 'The Backpack', 'pencil', 'el lápiz'],
['School', 'The Backpack', 'backpack', 'la mochila'],
['School', 'The Backpack', 'pen', 'el bolígrafo'],
['School', 'The Backpack', 'notebook', 'el cuaderno'],
['School', 'The Backpack', 'book', 'el libro'],
['School', 'The Backpack', 'calculator', 'la calculadora'],
['School', 'The Backpack', 'dictionary', 'el diccionario'],
['School', 'The Backpack', 'paper', 'el papel'],
['School', 'The Backpack', 'eraser', 'la goma de borrar'],
['School', 'The Backpack', 'scissors', 'las tijeras'],
['School', 'The Backpack', 'to read', 'leer'],
['School', 'The Backpack', 'to write', 'escribir'],
['School', 'The Backpack', 'to listen', 'escuchar'],
['School', 'The Backpack', 'to study', 'estudiar'],
['School', 'Subjects', 'art', 'el arte'],
['School', 'Subjects', 'science', 'las ciencias'],
['School', 'Subjects', 'physical education', 'la educación física'],
['School', 'Subjects', 'history', 'la historia'],
['School', 'Subjects', 'math', 'las matemáticas'],
['School', 'Subjects', 'music', 'la música'],
['School', 'Subjects', 'geography', 'la geografía'],
['School', 'Subjects', 'languages', 'los idiomas'],
['School', 'Subjects', 'computer', 'la computadora'],
['School', 'Subjects', 'map', 'el mapa'],
['School', 'Subjects', 'subjects', 'las materias'],
['School', 'Subjects', 'to learn', 'aprender'],
['School', 'Subjects', 'to teach', 'enseñar'],
['School', 'The Lesson', 'circle', 'el círculo'],
['School', 'The Lesson', 'square', 'el cuadrado'],
['School', 'The Lesson', 'rectangle', 'el rectángulo'],
['School', 'The Lesson', 'triangle', 'el triángulo'],
['School', 'The Lesson', 'test', 'el examen'],
['School', 'The Lesson', 'quiz', 'la prueba'],
['School', 'The Lesson', 'lesson', 'la lección'],
['School', 'The Lesson', 'homework', 'la tarea'],
['School', 'The Lesson', 'classmates', 'los compañeros de clase'],
['School', 'The Lesson', 'to draw', 'dibujar'],
['School', 'The Lesson', 'to speak', 'hablar'],
['School', 'The Lesson', 'to arrive', 'llegar'],
['School', 'The Lesson', 'to leave', 'salir'],
['School', 'The Lesson', 'to ask a question', 'hacer una pregunta'],
['School', 'The Lesson', 'to answer', 'contestar'],
# ['The School', 'Verbs', 'to read', 'leer'],
# ['The School', 'Verbs', 'to write', 'escribir'],
# ['The School', 'Verbs', 'to listen', 'escuchar'],
# ['The School', 'Verbs', 'to study', 'estudiar'],
# ['The School', 'Verbs', 'to learn', 'aprender'],
# ['The School', 'Verbs', 'to teach', 'enseñar'],
# ['The School', 'Verbs', 'to draw', 'dibujar'],
# ['The School', 'Verbs', 'to speak', 'hablar'],
# ['The School', 'Verbs', 'to arrive', 'llegar'],
# ['The School', 'Verbs', 'to leave', 'salir'],
['The_Trip', 'The Trip', 'luggage', 'el equipaje'],
['The_Trip', 'The Trip', 'suitcase', 'la maleta'],
['The_Trip', 'The Trip', 'ship', 'el barco'],
['The_Trip', 'The Trip', 'train', 'el tren'],
['The_Trip', 'The Trip', 'car', 'el coche'],
['The_Trip', 'The Trip', 'entrance', 'la entrada'],
['The_Trip', 'The Trip', 'exit', 'la salida'],
['The_Trip', 'The Trip', 'roller coaster', 'la montaña rusa'],
['The_Trip', 'The Trip', 'goodbye', 'adiós'],
['The_Trip', 'The Trip', 'to travel', 'viajar'],
['The_Trip', 'The Trip', 'to pack your bags', 'hacer las maletas'],
['The_Trip', 'The Trip', 'to go on vacation', 'ir de vacaciones'],
['The_Trip', 'The Trip', 'to camp', 'acampar'],
['The_Trip', 'The Airport', 'airplane', 'el avión'],
['The_Trip', 'The Airport', 'airport', 'el aeropuerto'],
['The_Trip', 'The Airport', 'ticket', 'el boleto'],
['The_Trip', 'The Airport', 'pilot', 'el piloto'],
['The_Trip', 'The Airport', 'flight', 'el vuelo'],
['The_Trip', 'The Airport', 'passenger boy', 'el pasajero'],
['The_Trip', 'The Airport', 'passenger girl', 'la pasajera'],
['The_Trip', 'The Airport', 'seat', 'el asiento'],
['The_Trip', 'The Airport', 'seat belt', 'el cinturón de seguridad'],
['The_Trip', 'The Airport', 'security', 'la seguridad'],
['The_Trip', 'The Airport', 'to fly', 'volar'],
['The_Trip', 'The Airport', 'to board', 'abordar'],
['The_Trip', 'The Airport', 'to take off', 'despegar'],
['The_Trip', 'The Airport', 'to land', 'aterrizar'],
['The_Trip', 'The Hotel', 'room', 'la habitación'],
['The_Trip', 'The Hotel', 'bed', 'la cama'],
['The_Trip', 'The Hotel', 'towel', 'la toalla'],
['The_Trip', 'The Hotel', 'key', 'la llave'],
['The_Trip', 'The Hotel', 'bathroom', 'el baño'],
['The_Trip', 'The Hotel', 'pool', 'la piscina'],
['The_Trip', 'The Hotel', 'gift shop', 'la tienda de regalos'],
['The_Trip', 'The Hotel', 'guest', 'el huésped'],
['The_Trip', 'The Hotel', 'to sleep', 'dormir'],
['The_Trip', 'The Hotel', 'to relax', 'relajar'],
['The_Trip', 'The Hotel', 'to go shopping', 'ir de compras'],
['The_Trip', 'The Beach', 'beach', 'la playa'],
['The_Trip', 'The Beach', 'sand', 'la arena'],
['The_Trip', 'The Beach', 'water', 'el agua'],
['The_Trip', 'The Beach', 'sandals', 'las sandalias'],
['The_Trip', 'The Beach', 'sunscreen', 'la loción protectora'],
['The_Trip', 'The Beach', 'palm tree', 'la palmera'],
['The_Trip', 'The Beach', 'waves', 'las olas'],
['The_Trip', 'The Beach', 'seashells', 'los caracoles'],
['The_Trip', 'The Beach', 'sailboat', 'el velero'],
['The_Trip', 'The Beach', 'lifeguard', 'el/la salvavidas'],
['The_Trip', 'The Beach', 'to fish', 'pescar'],
['The_Trip', 'The Beach', 'to swim', 'nadar'],
['The_Trip', 'The Beach', 'to play', 'jugar'],
# ['The_Trip', 'Verbs', 'to travel', 'viajar'],
# ['The_Trip', 'Verbs', 'to pack your bags', 'hacer las maletas'],
# ['The_Trip', 'Verbs', 'to go on vacation', 'ir de vacaciones'],
# ['The_Trip', 'Verbs', 'to camp', 'acampar'],
# ['The_Trip', 'Verbs', 'to fly', 'volar'],
# ['The_Trip', 'Verbs', 'to board', 'abordar'],
# ['The_Trip', 'Verbs', 'to take off', 'despegar'],
# ['The_Trip', 'Verbs', 'to land', 'aterrizar'],
# ['The_Trip', 'Verbs', 'to sleep', 'dormir'],
# ['The_Trip', 'Verbs', 'to relax', 'relajar'],
# ['The_Trip', 'Verbs', 'to go shopping', 'ir de compras'],
# ['The_Trip', 'Verbs', 'to fish', 'pescar'],
# ['The_Trip', 'Verbs', 'to swim', 'nadar'],
# ['The_Trip', 'Verbs', 'to play', 'jugar'],
# ['Verbs', 'The City', 'to walk', 'caminar'],
# ['Verbs', 'The City', 'to wait for', 'esperar'],
# ['Verbs', 'The City', 'to be careful', 'tener cuidado'],
# ['Verbs', 'The City', 'to work', 'trabajar'],
# ['Verbs', 'The City', 'to buy', 'comprar'],
# ['Verbs', 'The City', 'to look for', 'buscar'],
# ['Verbs', 'The City', 'to ride', 'montar'],
# ['Verbs', 'The City', 'to cross', 'cruzar'],
# ['Verbs', 'The City', 'to get on the bus', 'subir al autobús'],
# ['Verbs', 'The City', 'to get off the bus', 'bajar del autobús'],
# ['Verbs', 'The City', 'to go', 'ir '],
# ['Verbs', 'The City', 'to drive', 'manejar'],
# ['Verbs', 'The City', 'to crash', 'chocar'],
# ['Verbs', 'The City', 'to go fast', 'ir rápido'],
# ['Verbs', 'The City', 'to go slowly', 'ir despacio'],
# ['Verbs', 'The City', 'to the left', 'a la izquierda'],
# ['Verbs', 'The City', 'to the right', 'a la derecha'],
# ['Verbs', 'The House', 'to look at', 'mirar'],
# ['Verbs', 'The House', 'to sit down', 'sentarse'],
# ['Verbs', 'The House', 'to get up', 'levantarse'],
# ['Verbs', 'The House', 'to put', 'poner'],
# ['Verbs', 'The House', 'to jump', 'saltar'],
# ['Verbs', 'The House', 'to turn around', 'dar vueltas'],
# ['Verbs', 'The House', 'to dance', 'bailar'],
# ['Verbs', 'The House', 'to go to bed', 'acostarse'],
# ['Verbs', 'The House', 'to wake up', 'despertarse'],
# ['Verbs', 'The House', 'to grab', 'agarrar'],
# ['Verbs', 'The House', 'to dry off', 'secarse'],
# ['Verbs', 'The House', 'to touch', 'tocar'],
# ['Verbs', 'The House', 'to sing', 'cantar'],
# ['Verbs', 'The School', 'to ask a question', 'hacer una pregunta'],
# ['Verbs', 'The School', 'to answer', 'contestar'],
# ['Verbs', 'The School', 'to eat lunch', 'almorzar'],
# ['Verbs', 'The School', 'to read', 'leer'],
# ['Verbs', 'The School', 'to write', 'escribir'],
# ['Verbs', 'The School', 'to listen', 'escuchar'],
# ['Verbs', 'The School', 'to study', 'estudiar'],
# ['Verbs', 'The School', 'to learn', 'aprender'],
# ['Verbs', 'The School', 'to teach', 'enseñar'],
# ['Verbs', 'The School', 'to draw', 'dibujar'],
# ['Verbs', 'The School', 'to speak', 'hablar'],
# ['Verbs', 'The School', 'to arrive', 'llegar'],
# ['Verbs', 'The School', 'to leave', 'salir'],
# ['Verbs', 'The Trip', 'to travel', 'viajar'],
# ['Verbs', 'The Trip', 'to pack your bags', 'hacer las maletas'],
# ['Verbs', 'The Trip', 'to go on vacation', 'ir de vacaciones'],
# ['Verbs', 'The Trip', 'to camp', 'acampar'],
# ['Verbs', 'The Trip', 'to fly', 'volar'],
# ['Verbs', 'The Trip', 'to board', 'abordar'],
# ['Verbs', 'The Trip', 'to take off', 'despegar'],
# ['Verbs', 'The Trip', 'to land', 'aterrizar'],
# ['Verbs', 'The Trip', 'to sleep', 'dormir'],
# ['Verbs', 'The Trip', 'to relax', 'relajar'],
# ['Verbs', 'The Trip', 'to go shopping', 'ir de compras'],
# ['Verbs', 'The Trip', 'to fish', 'pescar'],
# ['Verbs', 'The Trip', 'to swim', 'nadar'],
# ['Verbs', 'The Trip', 'to play', 'jugar']
]


words.each do |line|
	Theme.find_or_create_by_name(line[0])
	Subtheme.find_or_create_by_name_english(line[1])

	theme = line[0].lstrip.downcase
  # theme = line[0].gsub('The', '').lstrip.downcase
  subtheme = line[1].gsub('The', '').lstrip.downcase.tr(" ", "_")
	word_english = line[2]
	filename = line[2].tr(" ", "_")
	

	# # Attempt at correcting audio filenames with a script
	# audio_array = filename.split("_")
	# if audio_array.length > 1
	# 	audio_filename = audio_array[0] + " " + audio_array[1].capitalize + " "
	# 	(2..audio_array.length-1).each do |i|
	# 		audio_filename += audio_array[i] + " "
	# 	end
	# 	audio_filename = audio_filename.rstrip
	# else
	# 	audio_filename = audio_array[0]
	# end
	# audio_filename += " single word Spanish"
	# puts audio_filename

	word_spanish = line[3]
	Word.create!(
		:image => server_prefix + 'theme_' + theme + '/subtheme/word_images/images_' + subtheme + '/' + filename + '.jpg',
		:mp3 => server_prefix + 'theme_' + theme + '/subtheme/word_audio/audio_' + subtheme + '/' + filename + '.mp3',
		:pdf => server_prefix + 'theme_' + theme + '/subtheme/word_pdfs/pdfs_' + subtheme + '/' + filename + '_' + theme + '_spanish.pdf',
		:name => word_spanish,
		:name_english => word_english,
		:subtheme_id => Subtheme.find_by_name_english(line[1]).id
	)
end