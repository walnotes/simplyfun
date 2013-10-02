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
	image: server_prefix + 'subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
	pdf_flashcards: server_prefix + 'subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
	theme_id: city_theme.id
end


# Create the theme
house_theme = Theme.create! name: 'La Casa', name_english: 'House', image: server_prefix + 'theme_house/theme_image_house.jpg', pdf: server_prefix + 'theme_house/theme_house_coloringbook.pdf', language_id: spanish.id
# Create an array of arrays of the subtheme
subthemes = [['The Bathroom', 'El Baño', 'bathroom'], ['The Bedroom', 'La Habitacíon', 'bedroom'], ['Kitchen', 'La Cocina', 'kitchen'], ['The Living Room', 'La Sala', 'living_room']]
# Create the subthemes
subthemes.each do |s|
	name_english = s[0]
	filename = s[2]
	name = s[1]
	subtheme = Subtheme.create! name: name, 
	name_english: name_english, 
	image: server_prefix + 'subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
	pdf_flashcards: server_prefix + 'subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
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
	image: server_prefix + 'subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
	pdf_flashcards: server_prefix + 'subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
	theme_id: school_theme.id
end

# Create the theme
the_trip_theme = Theme.create! name: 'El Viaje', name_english: 'The Trip', image: server_prefix + 'theme_the_trip/theme_image_the_trip.jpg', pdf: server_prefix + 'theme_the_trip/theme_the_trip_coloringbook.pdf', language_id: spanish.id
# Create an array of arrays of the subtheme
subthemes = [['The Airport', 'El Aeropuerto', 'airport'], ['The Beach', 'La Playa', 'beach'], ['The Hotel', 'El Hotel', 'hotel'], ['The Trip', 'El Viaje', 'the_trip']]
# Create the subthemes
subthemes.each do |s|
	name_english = s[0]
	filename = s[2]
	name = s[1]
	subtheme = Subtheme.create! name: name, 
	name_english: name_english, 
	image: server_prefix + 'subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
	pdf_flashcards: server_prefix + 'subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
	theme_id: the_trip_theme.id
end





Word.delete_all
words = [['The City', 'The Street', 'traffic light', 'el semáforo'],
['The City', 'The Street', 'intersection', 'la intersección'],
['The City', 'The Street', 'sign', 'el letrero'],
['The City', 'The Street', 'sidewalk', 'la acera'],
['The City', 'The Street', 'mailbox', 'el buzón'],
['The City', 'The Street', 'bridge', 'el puente'],
['The City', 'The Street', 'pedestrian', 'el peatón'],
['The City', 'The Street', 'river', 'el río'],
['The City', 'The Street', 'watch out careful', '¡Cuidado!'],
['The City', 'The Street', 'to walk', 'caminar'],
['The City', 'The Street', 'to wait for', 'esperar'],
['The City', 'The Street', 'to be careful', 'tener cuidado'],
['The City', 'The Buildings', 'museum', 'el museo'],
['The City', 'The Buildings', 'hospital', 'el hospital'],
['The City', 'The Buildings', 'park', 'el parque'],
['The City', 'The Buildings', 'school', 'la escuela'],
['The City', 'The Buildings', 'movie theater', 'el cine'],
['The City', 'The Buildings', 'mall', 'el centro comercial'],
['The City', 'The Buildings', 'restaurant', 'el restaurante'],
['The City', 'The Buildings', 'apartment', 'el apartamento'],
['The City', 'The Buildings', 'post office', 'el correo'],
['The City', 'The Buildings', 'bank', 'el banco'],
['The City', 'The Buildings', 'to work', 'trabajar'],
['The City', 'The Buildings', 'to buy', 'comprar'],
['The City', 'The Buildings', 'to look for', 'buscar'],
['The City', 'The Transportation', 'bus', 'el autobús'],
['The City', 'The Transportation', 'bus station', 'la estación autobús'],
['The City', 'The Transportation', 'plane', 'el avión'],
['The City', 'The Transportation', 'taxi', 'el taxi'],
['The City', 'The Transportation', 'traffic', 'el tráfico'],
['The City', 'The Transportation', 'train', 'el tren'],
['The City', 'The Transportation', 'bicycle', 'la bicicleta'],
['The City', 'The Transportation', 'motorcycle', 'la motocicleta'],
['The City', 'The Transportation', 'to ride', 'montar'],
['The City', 'The Transportation', 'to cross', 'cruzar'],
['The City', 'The Transportation', 'to get on the bus', 'subir al autobús'],
['The City', 'The Transportation', 'to get off the bus', 'bajar del autobús'],
['The City', 'The Car', 'horn', 'el claxon'],
['The City', 'The Car', 'mirror', 'el espejo'],
['The City', 'The Car', 'seat belt', 'el cinturón de seguridad'],
['The City', 'The Car', 'seat', 'el asiento'],
['The City', 'The Car', 'wheel', 'la rueda'],
['The City', 'The Car', 'driver (boy)', 'el conductor'],
['The City', 'The Car', 'driver (girl)', 'la conductora'],
['The City', 'The Car', 'to go', 'ir'],
['The City', 'The Car', 'to drive', 'manejar'],
['The City', 'The Car', 'to crash', 'chocar'],
['The City', 'The Car', 'to go fast', 'ir rápido'],
['The City', 'The Car', 'to go slowly', 'ir despacio'],
['The City', 'The Car', 'to the left', 'a la izquierda'],
['The City', 'The Car', 'to the right', 'a la derecha'],
['The City', 'Verbs', 'to walk', 'caminar'],
['The City', 'Verbs', 'to wait for', 'esperar'],
['The City', 'Verbs', 'to be careful', 'tener cuidado'],
['The City', 'Verbs', 'to work', 'trabajar'],
['The City', 'Verbs', 'to buy', 'comprar'],
['The City', 'Verbs', 'to look for', 'buscar'],
['The City', 'Verbs', 'to ride', 'montar'],
['The City', 'Verbs', 'to cross', 'cruzar'],
['The City', 'Verbs', 'to get on the bus', 'subir al autobús'],
['The City', 'Verbs', 'to get off the bus', 'bajar del autobús'],
['The City', 'Verbs', 'to go', 'ir'],
['The City', 'Verbs', 'to drive', 'manejar'],
['The City', 'Verbs', 'to crash', 'chocar'],
['The City', 'Verbs', 'to go fast', 'ir rápido'],
['The City', 'Verbs', 'to go slowly', 'ir despacio'],
['The City', 'Verbs', 'to the left', 'a la izquierda'],
['The City', 'Verbs', 'to the right', 'a la derecha'],
['The House', 'The Living Room', 'fireplace', 'la chimenea'],
['The House', 'The Living Room', 'staircase', 'la escalera'],
['The House', 'The Living Room', 'telephone', 'el teléfono'],
['The House', 'The Living Room', 'couch', 'el sofá'],
['The House', 'The Living Room', 'lamp', 'la lámpara'],
['The House', 'The Living Room', 'window', 'la ventana'],
['The House', 'The Living Room', 'rug', 'la alfombra'],
['The House', 'The Living Room', 'television set', 'el televisor'],
['The House', 'The Living Room', 'remote', 'el remoto'],
['The House', 'The Bedroom', 'closet', 'el armario'],
['The House', 'The Bedroom', 'clock', 'el reloj'],
['The House', 'The Bedroom', 'pillow', 'la almohada'],
['The House', 'The Bedroom', 'bed', 'la cama'],
['The House', 'The Bedroom', 'hanger', 'la percha'],
['The House', 'The Bedroom', 'blanket', 'la manta'],
['The House', 'The Bedroom', 'dresser', 'la cómoda'],
['The House', 'The Bedroom', 'door', 'la puerta'],
['The House', 'The Bedroom', 'radio', 'la radio'],
['The House', 'The Kitchen', 'frying pan', 'la sartén'],
['The House', 'The Kitchen', 'dishwasher', 'el lavaplatos'],
['The House', 'The Kitchen', 'oven', 'el horno'],
['The House', 'The Kitchen', 'microwave', 'el horno microondas'],
['The House', 'The Kitchen', 'stove', 'la estufa'],
['The House', 'The Kitchen', 'toaster', 'el tostador'],
['The House', 'The Kitchen', 'table', 'la mesa'],
['The House', 'The Kitchen', 'chair', 'la silla'],
['The House', 'The Kitchen', 'trash can', 'el basurero'],
['The House', 'The Kitchen', 'refrigerator', 'el refrigerador'],
['The House', 'The Bathroom', 'shampoo', 'el champú'],
['The House', 'The Bathroom', 'soap', 'el jabón'],
['The House', 'The Bathroom', 'toothpaste', 'la pasta de dientes'],
['The House', 'The Bathroom', 'toothbrush', 'el cepillo de dientes'],
['The House', 'The Bathroom', 'shower', 'la ducha'],
['The House', 'The Bathroom', 'sink', 'el lavamanos'],
['The House', 'The Bathroom', 'towel', 'la toalla'],
['The House', 'The Bathroom', 'toilet', 'el excusado'],
['The House', 'The Bathroom', 'bathtub', 'la bañadera'],
['The House', 'Verbs', 'to look at', 'mirar'],
['The House', 'Verbs', 'to sit down', 'sentarse'],
['The House', 'Verbs', 'to get up', 'levantarse'],
['The House', 'Verbs', 'to put', 'poner'],
['The House', 'Verbs', 'to jump', 'saltar'],
['The House', 'Verbs', 'to turn around', 'dar vueltas'],
['The House', 'Verbs', 'to dance', 'bailar'],
['The House', 'Verbs', 'to go to bed', 'acostarse'],
['The House', 'Verbs', 'to wake up', 'despertarse'],
['The House', 'Verbs', 'to grab', 'agarrar'],
['The House', 'Verbs', 'to dry off', 'secarse'],
['The House', 'Verbs', 'to touch', 'tocar'],
['The House', 'Verbs', 'to sing', 'cantar'],
['The School', 'The School', 'classroom', 'el aula'],
['The School', 'The School', 'library', 'la biblioteca'],
['The School', 'The School', 'cafeteria', 'la cafetería'],
['The School', 'The School', 'gym', 'el gimnasio'],
['The School', 'The School', 'teacher (boy)', 'el maestro'],
['The School', 'The School', 'teacher (girl)', 'la maestra'],
['The School', 'The School', 'student (boy)', 'el estudiante'],
['The School', 'The School', 'student (girl)', 'la estudiante'],
['The School', 'The School', 'playground', 'el patio de recreo'],
['The School', 'The School', 'swing', 'el columpio'],
['The School', 'The School', 'to ask a question', 'hacer una pregunta'],
['The School', 'The School', 'to answer', 'contestar'],
['The School', 'The School', 'to eat lunch', 'almorzar'],
['The School', 'The Backpack', 'pencil', 'el lápiz'],
['The School', 'The Backpack', 'pen', 'el bolígrafo'],
['The School', 'The Backpack', 'notebook', 'el cuaderno'],
['The School', 'The Backpack', 'book', 'el libro'],
['The School', 'The Backpack', 'calculator', 'la calculadora'],
['The School', 'The Backpack', 'dictionary', 'el diccionario'],
['The School', 'The Backpack', 'paper', 'el papel'],
['The School', 'The Backpack', 'eraser', 'la goma de borrar'],
['The School', 'The Backpack', 'scissors', 'las tijeras'],
['The School', 'The Backpack', 'to read', 'leer'],
['The School', 'The Backpack', 'to write', 'escribir'],
['The School', 'The Backpack', 'to listen', 'escuchar'],
['The School', 'The Backpack', 'to study', 'estudiar'],
['The School', 'The Subjects', 'Art', 'el arte'],
['The School', 'The Subjects', 'Science', 'las ciencias'],
['The School', 'The Subjects', 'Physical Education', 'la educación física'],
['The School', 'The Subjects', 'History', 'la historia'],
['The School', 'The Subjects', 'Math', 'las matemáticas'],
['The School', 'The Subjects', 'Music', 'la música'],
['The School', 'The Subjects', 'Geography', 'la geografía'],
['The School', 'The Subjects', 'Languages', 'los idiomas'],
['The School', 'The Subjects', 'computer', 'la computadora'],
['The School', 'The Subjects', 'map', 'el mapa'],
['The School', 'The Subjects', 'to learn', 'aprender'],
['The School', 'The Subjects', 'to teach', 'enseñar'],
['The School', 'The Lesson', 'circle', 'el círculo'],
['The School', 'The Lesson', 'square', 'el cuadrado'],
['The School', 'The Lesson', 'rectangle', 'el rectángulo'],
['The School', 'The Lesson', 'triangle', 'el triángulo'],
['The School', 'The Lesson', 'test', 'el examen'],
['The School', 'The Lesson', 'quiz', 'la prueba'],
['The School', 'The Lesson', 'homework', 'la tarea'],
['The School', 'The Lesson', 'classmates', 'los compañeros de clase'],
['The School', 'The Lesson', 'to draw', 'dibujar'],
['The School', 'The Lesson', 'to speak', 'hablar'],
['The School', 'The Lesson', 'to arrive', 'llegar'],
['The School', 'The Lesson', 'to leave', 'salir'],
['The School', 'Verbs', 'to ask a question', 'hacer una pregunta'],
['The School', 'Verbs', 'to answer', 'contestar'],
['The School', 'Verbs', 'to eat lunch', 'almorzar'],
['The School', 'Verbs', 'to read', 'leer'],
['The School', 'Verbs', 'to write', 'escribir'],
['The School', 'Verbs', 'to listen', 'escuchar'],
['The School', 'Verbs', 'to study', 'estudiar'],
['The School', 'Verbs', 'to learn', 'aprender'],
['The School', 'Verbs', 'to teach', 'enseñar'],
['The School', 'Verbs', 'to draw', 'dibujar'],
['The School', 'Verbs', 'to speak', 'hablar'],
['The School', 'Verbs', 'to arrive', 'llegar'],
['The School', 'Verbs', 'to leave', 'salir'],
['The Trip', 'The Trip', 'luggage', 'el equipaje'],
['The Trip', 'The Trip', 'suitcase', 'la maleta'],
['The Trip', 'The Trip', 'ship', 'el barco'],
['The Trip', 'The Trip', 'train', 'el tren'],
['The Trip', 'The Trip', 'car', 'el coche'],
['The Trip', 'The Trip', 'entrance', 'la entrada'],
['The Trip', 'The Trip', 'exit', 'la salida'],
['The Trip', 'The Trip', 'roller coaster', 'la montaña rusa'],
['The Trip', 'The Trip', 'goodbye', 'adiós'],
['The Trip', 'The Trip', 'to travel', 'viajar'],
['The Trip', 'The Trip', 'to pack your bags', 'hacer las maletas'],
['The Trip', 'The Trip', 'to go on vacation', 'ir de vacaciones'],
['The Trip', 'The Trip', 'to camp', 'acampar'],
['The Trip', 'The Airport', 'airplane', 'el avión'],
['The Trip', 'The Airport', 'ticket', 'el boleto'],
['The Trip', 'The Airport', 'pilot', 'el piloto'],
['The Trip', 'The Airport', 'flight', 'el vuelo'],
['The Trip', 'The Airport', 'passenger (boy)', 'el pasajero'],
['The Trip', 'The Airport', 'passenger (girl)', 'la pasajera'],
['The Trip', 'The Airport', 'seat', 'el asiento'],
['The Trip', 'The Airport', 'seat belt', 'el cinturón de seguridad'],
['The Trip', 'The Airport', 'security', 'la seguridad'],
['The Trip', 'The Airport', 'to fly', 'volar'],
['The Trip', 'The Airport', 'to board', 'abordar'],
['The Trip', 'The Airport', 'to take off', 'despegar'],
['The Trip', 'The Airport', 'to land', 'aterrizar'],
['The Trip', 'The Hotel', 'room', 'la habitación'],
['The Trip', 'The Hotel', 'bed', 'la cama'],
['The Trip', 'The Hotel', 'towel', 'la toalla'],
['The Trip', 'The Hotel', 'key', 'la llave'],
['The Trip', 'The Hotel', 'bathroom', 'el baño'],
['The Trip', 'The Hotel', 'pool', 'la piscina'],
['The Trip', 'The Hotel', 'gift shop', 'la tienda de regalos'],
['The Trip', 'The Hotel', 'guest', 'el huésped'],
['The Trip', 'The Hotel', 'to sleep', 'dormir'],
['The Trip', 'The Hotel', 'to relax', 'relajar'],
['The Trip', 'The Hotel', 'to go shopping', 'ir de compras'],
['The Trip', 'The Beach', 'sand', 'la arena'],
['The Trip', 'The Beach', 'water', 'el agua'],
['The Trip', 'The Beach', 'sandals', 'las sandalias'],
['The Trip', 'The Beach', 'sunscreen', 'la loción protectora'],
['The Trip', 'The Beach', 'palm tree', 'la palmera'],
['The Trip', 'The Beach', 'waves', 'las olas'],
['The Trip', 'The Beach', 'seashells', 'los caracoles'],
['The Trip', 'The Beach', 'sailboat', 'el velero'],
['The Trip', 'The Beach', 'lifeguard', 'el/la salvavidas'],
['The Trip', 'The Beach', 'to fish', 'pescar'],
['The Trip', 'The Beach', 'to swim', 'nadar'],
['The Trip', 'The Beach', 'to play', 'jugar'],
['The Trip', 'Verbs', 'to travel', 'viajar'],
['The Trip', 'Verbs', 'to pack your bags', 'hacer las maletas'],
['The Trip', 'Verbs', 'to go on vacation', 'ir de vacaciones'],
['The Trip', 'Verbs', 'to camp', 'acampar'],
['The Trip', 'Verbs', 'to fly', 'volar'],
['The Trip', 'Verbs', 'to board', 'abordar'],
['The Trip', 'Verbs', 'to take off', 'despegar'],
['The Trip', 'Verbs', 'to land', 'aterrizar'],
['The Trip', 'Verbs', 'to sleep', 'dormir'],
['The Trip', 'Verbs', 'to relax', 'relajar'],
['The Trip', 'Verbs', 'to go shopping', 'ir de compras'],
['The Trip', 'Verbs', 'to fish', 'pescar'],
['The Trip', 'Verbs', 'to swim', 'nadar'],
['The Trip', 'Verbs', 'to play', 'jugar'],
['Verbs', 'The City', 'to walk', 'caminar'],
['Verbs', 'The City', 'to wait for', 'esperar'],
['Verbs', 'The City', 'to be careful', 'tener cuidado'],
['Verbs', 'The City', 'to work', 'trabajar'],
['Verbs', 'The City', 'to buy', 'comprar'],
['Verbs', 'The City', 'to look for', 'buscar'],
['Verbs', 'The City', 'to ride', 'montar'],
['Verbs', 'The City', 'to cross', 'cruzar'],
['Verbs', 'The City', 'to get on the bus', 'subir al autobús'],
['Verbs', 'The City', 'to get off the bus', 'bajar del autobús'],
['Verbs', 'The City', 'to go', 'ir '],
['Verbs', 'The City', 'to drive', 'manejar'],
['Verbs', 'The City', 'to crash', 'chocar'],
['Verbs', 'The City', '(to go) fast', 'ir rápido'],
['Verbs', 'The City', '(to go) slowly', 'ir despacio'],
['Verbs', 'The City', 'to the left', 'a la izquierda'],
['Verbs', 'The City', 'to the right', 'a la derecha'],
['Verbs', 'The House', 'to look at', 'mirar'],
['Verbs', 'The House', 'to sit down', 'sentarse'],
['Verbs', 'The House', 'to get up', 'levantarse'],
['Verbs', 'The House', 'to put', 'poner'],
['Verbs', 'The House', 'to jump', 'saltar'],
['Verbs', 'The House', 'to turn around', 'dar vueltas'],
['Verbs', 'The House', 'to dance', 'bailar'],
['Verbs', 'The House', 'to go to bed', 'acostarse'],
['Verbs', 'The House', 'to wake up', 'despertarse'],
['Verbs', 'The House', 'to grab', 'agarrar'],
['Verbs', 'The House', 'to dry off', 'secarse'],
['Verbs', 'The House', 'to touch', 'tocar'],
['Verbs', 'The House', 'to sing', 'cantar'],
['Verbs', 'The School', 'to ask a question', 'hacer una pregunta'],
['Verbs', 'The School', 'to answer', 'contestar'],
['Verbs', 'The School', 'to eat lunch', 'almorzar'],
['Verbs', 'The School', 'to read', 'leer'],
['Verbs', 'The School', 'to write', 'escribir'],
['Verbs', 'The School', 'to listen', 'escuchar'],
['Verbs', 'The School', 'to study', 'estudiar'],
['Verbs', 'The School', 'to learn', 'aprender'],
['Verbs', 'The School', 'to teach', 'enseñar'],
['Verbs', 'The School', 'to draw', 'dibujar'],
['Verbs', 'The School', 'to speak', 'hablar'],
['Verbs', 'The School', 'to arrive', 'llegar'],
['Verbs', 'The School', 'to leave', 'salir'],
['Verbs', 'The Trip', 'to travel', 'viajar'],
['Verbs', 'The Trip', 'to pack your bags', 'hacer las maletas'],
['Verbs', 'The Trip', 'to go on vacation', 'ir de vacaciones'],
['Verbs', 'The Trip', 'to camp', 'acampar'],
['Verbs', 'The Trip', 'to fly', 'volar'],
['Verbs', 'The Trip', 'to board', 'abordar'],
['Verbs', 'The Trip', 'to take off', 'despegar'],
['Verbs', 'The Trip', 'to land', 'aterrizar'],
['Verbs', 'The Trip', 'to sleep', 'dormir'],
['Verbs', 'The Trip', 'to relax', 'relajar'],
['Verbs', 'The Trip', 'to go shopping', 'ir de compras'],
['Verbs', 'The Trip', 'to fish', 'pescar'],
['Verbs', 'The Trip', 'to swim', 'nadar'],
['Verbs', 'The Trip', 'to play', 'jugar']]


words.each do |line|
	Theme.find_or_create_by_name(line[0])
	Subtheme.find_or_create_by_name_english(line[1])

	theme = line[0].gsub('The', '').lstrip.downcase
	subtheme = line[1].gsub('The', '').lstrip.downcase
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
    # :pdf => server_prefix + 'theme_' + theme + '/subtheme/word_pdfs/pdfs_' + subtheme + '/' + filename + '.pdf',
		:pdf => server_prefix + 'theme_' + theme + '/subtheme/word_pdfs/pdfs_' + subtheme + '/' + filename + '_' + subtheme + '_spanish.pdf',
		:name => word_spanish,
		:name_english => word_english,
		:subtheme_id => Subtheme.find_by_name_english(line[1]).id
	)
end