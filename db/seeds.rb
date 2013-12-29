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

# Loop through the languages and create the themes, subthemes, and words for each.
languages = [['spanish','Spanish', 'Español'], ['french', 'French', 'Français'], ['vietnamese', 'Vietnamese', 'Việt']]

# The list of Themes
theme_list = ['city', 'house', 'school', 'the_trip']

# The list of Themes for each Language
theme_spanish = [['city', 'The City', 'La Ciudad'], ['house', 'House', 'La Casa'], ['school', 'School', 'La Escuela'], ['the_trip', 'The Trip', 'El Viaje']]
theme_french = [['city', 'The City', 'La Ville'], ['house', 'House', 'La Maison'], ['school', 'School', 'L\'École'], ['the_trip', 'The Trip', 'Le Voyage']]
theme_vietnamese = [['city', 'The City', ''], ['house', 'House', ''], ['school', 'School', ''], ['the_trip', 'The Trip', '']]

# The list of Subthemes
subtheme_list_city = ['buildings', 'car', 'street', 'transportation']
subtheme_list_house = ['bathroom', 'bedroom', 'kitchen', 'living room']
subtheme_list_school = ['backpack', 'lesson', 'school', 'subjects']
subtheme_list_the_trip = ['airport', 'beach', 'hotel', 'trip']

# The list of Subthemes for Spanish
subthemes_city_spanish = [['The Buildings', 'Los Edificios', 'buildings'], ['The Car', 'El Coche', 'car'], ['The Street', 'La Calle', 'street'], ['The Transportation', 'La Transportación', 'transportation']]
subthemes_house_spanish = [['The Bathroom', 'El Baño', 'bathroom'], ['The Bedroom', 'La Habitacíon', 'bedroom'], ['The Kitchen', 'La Cocina', 'kitchen'], ['The Living Room', 'La Sala', 'living room']]
subthemes_school_spanish = [['The Backpack', 'La Mochila', 'backpack'], ['The Lesson', 'La Lección', 'lesson'], ['The School', 'La Escuela', 'school'], ['Subjects', 'Las Materias', 'subjects']]
subthemes_the_trip_spanish = [['The Airport', 'El Aeropuerto', 'airport'], ['The Beach', 'La Playa', 'beach'], ['The Hotel', 'El Hotel', 'hotel'], ['The Trip', 'El Viaje', 'trip']]

# The list of Subthemes for French
subthemes_city_french = [['The Buildings', 'Les Bâtiments', 'buildings'], ['The Car', 'Le Transport', 'car'], ['The Street', 'La Rue', 'street'], ['The Transportation', 'La Voiture', 'transportation']]
subthemes_house_french = [['The Bathroom', 'Bain', 'bathroom'], ['The Bedroom', 'Chambre', 'bedroom'], ['The Kitchen', 'Cuisine', 'kitchen'], ['The Living Room', 'Chambre', 'living room']]
subthemes_school_french = [['The Backpack', 'Le Sac à Dos', 'backpack'], ['The Lesson', 'La Leçon', 'lesson'], ['The School', 'L\'École', 'school'], ['Subjects', 'Les Matières', 'subjects']]
subthemes_the_trip_french = [['The Airport', 'L’Aéroport', 'airport'], ['The Beach', 'La Plage', 'beach'], ['The Hotel', 'L’Hôtel', 'hotel'], ['The Trip', 'Le Voyage', 'trip']]

# The list of Subthemes for Vietnamese
subthemes_city_vietnamese = [['The Buildings', 'tòa nhà nhiều tầng', 'buildings'], ['The Car', 'xe ô tô', 'car'], ['The Street', 'đường phố', 'street'], ['The Transportation', 'giao thông', 'transportation']]
subthemes_house_vietnamese = [['The Bathroom', 'phòng tắm', 'bathroom'], ['The Bedroom', 'phòng ngủ', 'bedroom'], ['The Kitchen', 'nhà bếp', 'kitchen'], ['The Living Room', 'phòng khách', 'living room']]
subthemes_school_vietnamese = [['The Backpack', 'cái ba lô', 'backpack'], ['The Lesson', 'bài học', 'lesson'], ['The School', 'trường học', 'school'], ['Subjects', 'các môn học', 'subjects']]
subthemes_the_trip_vietnamese = [['The Airport', 'sân bay', 'airport'], ['The Beach', 'bãi biển', 'beach'], ['The Hotel', 'khách sạn', 'hotel'], ['The Trip', 'cuộc du ngoạn', 'trip']]


# Create an entry for each language
languages.each do |s|
	name_english = s[1]
	name = s[2]
	language_lower = s[0]
	language = Language.create! name_english: name_english, name: name

  # Files for each language are in folders for that language (e.g. sfs_site_french)
  server_prefix = 'http://fivesomnimedia.com/projects/sfs/sfs_site_' + s[0] + '/'

  # Create an entry for each Theme
  theme_list.each do |t|
    theme_language = 'theme_' + language_lower
    # theme = Theme.create! 
    #   name: theme_language[2], 
    #   name_english: theme_language[1], 
    #   image: server_prefix + 'theme_city/theme_image_' + theme_language[0] + '.jpg',
    #   pdf: server_prefix + 'theme_city/theme_' + theme_language[0] + '_coloringbook.pdf', 
    #   language_id: language.id
    theme = Theme.create! name: theme_language[2], name_english: theme_language[1], image: server_prefix + 'theme_city/theme_image_' + theme_language[0] + '.jpg', pdf: server_prefix + 'theme_city/theme_' + theme_language[0] + '_coloringbook.pdf', language_id: language.id

    # Create an entry for each Subtheme
    subthemes_name = 'subthemes_' + t + '_' + language_lower
    case subthemes_name
    when subthemes_city_spanish
      subthemes = subthemes_city_spanish
    when subthemes_house_spanish
      subthemes = subthemes_house_spanish
    when subthemes_school_spanish
      subthemes = subthemes_school_spanish
    when subthemes_the_trip_spanish
      subthemes = subthemes_the_trip_spanish

    when subthemes_city_french
      subthemes = subthemes_city_french
    when subthemes_house_french
      subthemes = subthemes_house_french
    when subthemes_school_french
      subthemes = subthemes_school_french
    when subthemes_the_trip_french
      subthemes = subthemes_the_trip_french

    when subthemes_city_vietnamese
      subthemes = subthemes_city_vietnamese
    when subthemes_house_vietnamese
      subthemes = subthemes_house_vietnamese
    when subthemes_school_vietnamese
      subthemes = subthemes_school_vietnamese
    when subthemes_the_trip_vietnamese
      subthemes = subthemes_the_trip_vietnamese

    else
      subthemes = subthemes_the_trip_vietnamese
    end
    # subthemes = [['The Buildings', 'Les Bâtiments', 'buildings'], ['The Car', 'Le Transport', 'car'], ['The Street', 'La Rue', 'street'], ['The Transportation', 'La Voiture', 'transportation']]

    # Create the subthemes
    subthemes.each do |w|
    	name_english = w[0]
    	filename = w[2]
    	name = w[1]
    	subtheme = Subtheme.create! name: name, 
    	name_english: name_english, 
    	image: server_prefix + 'theme_city/subtheme/subtheme_image/subtheme_image_' + filename + '.jpg', 
    	pdf_flashcards: server_prefix + 'theme_city/subtheme/subtheme_flashcards/subtheme_' + filename + '_flashcards.pdf', 
    	pdf_worksheet: server_prefix + 'theme_city/subtheme/subtheme_worksheets/subtheme_' + filename + '_worksheets.pdf', 
    	theme_id: theme.id
    end
  end

end


# The words section is not complete yet. -WK 2013Dec28

# Words - French
words = [
['City', 'The Street', 'traffic light', 'le feu de signalisation'],
['City', 'The Street', 'intersection', 'le croisement'],
['City', 'The Street', 'sign', 'le panneau'],
['City', 'The Street', 'sidewalk', 'le trottoir'],
# ['City', 'The Street', 'city', 'la ville'],
['City', 'The Street', 'mailbox', 'la boîte aux lettres'],
['City', 'The Street', 'bridge', 'le pont'],
['City', 'The Street', 'pedestrian', 'le piéton'],
['City', 'The Street', 'river', 'le fleuve'],
# ['City', 'The Street', 'street', 'la calle'],
['City', 'The Street', 'watch out careful', 'Attention!'],
['City', 'The Street', 'to walk', 'marcher'],
['City', 'The Street', 'to wait for', 'attendre'],
['City', 'The Street', 'to be careful', 'faire attention'],

['City', 'The Buildings', 'museum', 'le musée'],
['City', 'The Buildings', 'hospital', 'l\'hôpital'],
['City', 'The Buildings', 'park', 'le parc'],
['City', 'The Buildings', 'school', 'l\'école '],
['City', 'The Buildings', 'movie theater', 'le cinéma'],
['City', 'The Buildings', 'mall', 'le centre commercial'],
['City', 'The Buildings', 'restaurant', 'le restaurant'],
['City', 'The Buildings', 'apartment', 'l\'appartement'],
# ['City', 'The Buildings', 'buildings', 'les bâtiments'],
['City', 'The Buildings', 'post office', 'la poste'],
['City', 'The Buildings', 'bank', 'la banque'],
['City', 'The Buildings', 'to work', 'travailler'],
['City', 'The Buildings', 'to buy', 'acheter'],
['City', 'The Buildings', 'to look for', 'chercher'],

['City', 'The Transportation', 'bus', 'l\'autobus'],
# ['City', 'The Transportation', 'transportation', 'la transportación'],
['City', 'The Transportation', 'bus station', 'la station d\'autobus'],
['City', 'The Transportation', 'plane', 'l\'avion'],
['City', 'The Transportation', 'taxi', 'le taxi'],
['City', 'The Transportation', 'traffic', 'la circulation'],
['City', 'The Transportation', 'train', 'le train'],
['City', 'The Transportation', 'bicycle', 'le vélo'],
['City', 'The Transportation', 'motorcycle', 'la motocyclette'],
['City', 'The Transportation', 'to ride', 'faire (du vélo)'],
['City', 'The Transportation', 'to cross', 'traverser'],
['City', 'The Transportation', 'to get on the bus', 'monter dans l\'autobus'],
['City', 'The Transportation', 'to get off the bus', 'descendre de l\'autobus'],

# ['City', 'The Car', 'car', 'el coche'],
['City', 'The Car', 'horn', 'le klaxon'],
['City', 'The Car', 'mirror', 'le miroir'],
['City', 'The Car', 'seat belt', 'la ceinture de sécurité'],
['City', 'The Car', 'seat', 'le siège'],
['City', 'The Car', 'wheel', 'la roue'],
['City', 'The Car', 'driver boy', 'le chauffeur'],
['City', 'The Car', 'driver girl', 'la chauffeuse'],
['City', 'The Car', 'to go', 'aller'],
['City', 'The Car', 'to drive', 'conduire'],
['City', 'The Car', 'to crash', 's\'écraser'],
['City', 'The Car', 'to go fast', '(aller) rapidement'],
['City', 'The Car', 'to go slowly', '(aller) doucement'],
['City', 'The Car', 'to the left', 'à gauche'],
['City', 'The Car', 'to the right', 'à droite'],

['House', 'The Living Room', 'fireplace', 'cheminée'],
['House', 'The Living Room', 'staircase', 'échelle'],
['House', 'The Living Room', 'telephone', 'le téléphone'],
['House', 'The Living Room', 'couch', 'sofa'],
['House', 'The Living Room', 'lamp', 'lampe'],
['House', 'The Living Room', 'window', 'la fenêtre'],
# ['House', 'The Living Room', 'house', 'la casa'],
# ['House', 'The Living Room', 'living room', 'la sala'],
['House', 'The Living Room', 'rug', 'tapis'],
['House', 'The Living Room', 'television set', 'le poste de télévision'],
['House', 'The Living Room', 'remote', 'éloigné'],

['House', 'The Bedroom', 'closet', 'cabinet'],
['House', 'The Bedroom', 'clock', 'la pendule'],
['House', 'The Bedroom', 'pillow', 'l\'oreiller'],
['House', 'The Bedroom', 'bed', 'lit'],
# ['House', 'The Bedroom', 'bedroom', ''],
['House', 'The Bedroom', 'hanger', 'cintre'],
['House', 'The Bedroom', 'blanket', 'couverture'],
['House', 'The Bedroom', 'dresser', 'confortable'],
['House', 'The Bedroom', 'door', 'porte'],
['House', 'The Bedroom', 'radio', 'radio'],

['House', 'The Kitchen', 'frying pan', 'panoramique'],
# ['House', 'The Kitchen', 'kitchen', 'la cocina'],
['House', 'The Kitchen', 'dishwasher', 'le lave-vaisselle'],
['House', 'The Kitchen', 'oven', 'four'],
['House', 'The Kitchen', 'microwave', 'le four micro-ondes'],
['House', 'The Kitchen', 'stove', 'le poêle'],
['House', 'The Kitchen', 'toaster', 'le grille-pain'],
['House', 'The Kitchen', 'table', 'table'],
['House', 'The Kitchen', 'chair', 'la chaise'],
['House', 'The Kitchen', 'trash can', 'la poubelle'],
['House', 'The Kitchen', 'refrigerator', 'réfrigérateur'],

# ['House', 'The Bathroom', 'bathroom', 'el baño'],
['House', 'The Bathroom', 'shampoo', 'shampooing'],
['House', 'The Bathroom', 'soap', 'savon'],
['House', 'The Bathroom', 'toothpaste', 'le dentifrice'],
['House', 'The Bathroom', 'toothbrush', 'la brosse à dents'],
['House', 'The Bathroom', 'shower', 'douche'],
['House', 'The Bathroom', 'sink', 'évier'],
['House', 'The Bathroom', 'towel', 'serviette'],
['House', 'The Bathroom', 'toilet', 'la toilette'],
['House', 'The Bathroom', 'bathtub', 'la baignoire'],


['School', 'The School', 'classroom', 'la salle de classe'],
['School', 'The School', 'library', 'la bibliothèque'],
['School', 'The School', 'cafeteria', 'la cafétéria'],
['School', 'The School', 'gym', 'le gymnase'],
# ['School', 'The School', 'school', 'la escuela'],
['School', 'The School', 'teacher boy', 'le professeur'],
['School', 'The School', 'teacher girl', 'le professeur'],
['School', 'The School', 'student boy', 'l\'étudiant'],
['School', 'The School', 'student girl', 'l\'étudiante'],
['School', 'The School', 'playground', 'la cour de jeu'],
['School', 'The School', 'swing', 'la balançoire'],
['School', 'The School', 'to ask a question', 'poser une question'],
['School', 'The School', 'to answer', 'répondre'],
['School', 'The School', 'to eat lunch', 'déjeuner'],

['School', 'The Backpack', 'pencil', 'le crayon'],
# ['School', 'The Backpack', 'backpack', 'la mochila'],
['School', 'The Backpack', 'pen', 'le stylo'],
['School', 'The Backpack', 'notebook', 'le cahier'],
['School', 'The Backpack', 'book', 'le livre'],
['School', 'The Backpack', 'calculator', 'la calculatrice'],
['School', 'The Backpack', 'dictionary', 'le dictionnaire'],
['School', 'The Backpack', 'paper', 'le papier'],
['School', 'The Backpack', 'eraser', 'la gomme'],
['School', 'The Backpack', 'scissors', 'les ciseaux'],
['School', 'The Backpack', 'to read', 'lire'],
['School', 'The Backpack', 'to write', 'écrire'],
['School', 'The Backpack', 'to listen', 'écouter'],
['School', 'The Backpack', 'to study', 'étudier'],

['School', 'Subjects', 'art', 'l\'art'],
['School', 'Subjects', 'science', 'les sciences'],
['School', 'Subjects', 'physical education', 'l\'éducation physique'],
['School', 'Subjects', 'history', 'l\'histoire'],
['School', 'Subjects', 'math', 'les maths'],
['School', 'Subjects', 'music', 'la musique'],
['School', 'Subjects', 'geography', 'la géographie'],
['School', 'Subjects', 'languages', 'les langues'],
['School', 'Subjects', 'computer', 'l\'ordinateur'],
['School', 'Subjects', 'map', 'la carte'],
# ['School', 'Subjects', 'subjects', 'las materias'],
['School', 'Subjects', 'to learn', 'apprendre'],
['School', 'Subjects', 'to teach', 'enseigner'],

['School', 'The Lesson', 'circle', 'le cercle'],
['School', 'The Lesson', 'square', 'le carré'],
['School', 'The Lesson', 'rectangle', 'le rectangle'],
['School', 'The Lesson', 'triangle', 'le triangle'],
['School', 'The Lesson', 'test', 'l\'examen'],
['School', 'The Lesson', 'quiz', 'le quiz'],
# ['School', 'The Lesson', 'lesson', 'la lección'],
['School', 'The Lesson', 'homework', 'les devoirs'],
['School', 'The Lesson', 'classmates', 'les camarades de classe'],
['School', 'The Lesson', 'to draw', 'dessiner'],
['School', 'The Lesson', 'to speak', 'parler'],
['School', 'The Lesson', 'to arrive', 'arriver'],
['School', 'The Lesson', 'to leave', 'partir'],
# ['School', 'The Lesson', 'to ask a question', 'poser une question'],
# ['School', 'The Lesson', 'to answer', 'répondre'],

['The_Trip', 'The Trip', 'luggage', 'les bagages'],
['The_Trip', 'The Trip', 'suitcase', 'la valise'],
['The_Trip', 'The Trip', 'ship', 'le bateau'],
['The_Trip', 'The Trip', 'train', 'le train'],
['The_Trip', 'The Trip', 'car', 'la voiture'],
['The_Trip', 'The Trip', 'entrance', 'l\'entrée'],
['The_Trip', 'The Trip', 'exit', 'la sortie'],
['The_Trip', 'The Trip', 'roller coaster', 'les montagnes russes'],
['The_Trip', 'The Trip', 'goodbye', 'au revoir'],
['The_Trip', 'The Trip', 'to travel', 'voyager'],
['The_Trip', 'The Trip', 'to pack your bags', 'faire la valise'],
['The_Trip', 'The Trip', 'to go on vacation', 'aller en vacances'],
['The_Trip', 'The Trip', 'to camp', 'faire du camping'],

['The_Trip', 'The Airport', 'airplane', 'l\'avion'],
# ['The_Trip', 'The Airport', 'airport', 'el aeropuerto'],
['The_Trip', 'The Airport', 'ticket', 'le billet'],
['The_Trip', 'The Airport', 'pilot', 'le pilote'],
['The_Trip', 'The Airport', 'flight', 'le vol'],
['The_Trip', 'The Airport', 'passenger boy', 'le passager'],
['The_Trip', 'The Airport', 'passenger girl', 'la passagère'],
['The_Trip', 'The Airport', 'seat', 'le siège'],
['The_Trip', 'The Airport', 'seat belt', 'la ceinture de sécurité'],
['The_Trip', 'The Airport', 'security', 'le contrôle de sécurité'],
['The_Trip', 'The Airport', 'to fly', 'voler'],
['The_Trip', 'The Airport', 'to board', 'monter'],
['The_Trip', 'The Airport', 'to take off', 'décoller'],
['The_Trip', 'The Airport', 'to land', 'atterrir'],

['The_Trip', 'The Hotel', 'room', 'la chambre'],
['The_Trip', 'The Hotel', 'bed', 'le lit'],
['The_Trip', 'The Hotel', 'towel', 'la serviette'],
['The_Trip', 'The Hotel', 'key', 'la clé'],
['The_Trip', 'The Hotel', 'bathroom', 'la salle de bains'],
['The_Trip', 'The Hotel', 'pool', 'la piscine'],
['The_Trip', 'The Hotel', 'gift shop', 'le magasin de cadeau'],
['The_Trip', 'The Hotel', 'guest', 'le client'],
['The_Trip', 'The Hotel', 'to sleep', 'dormir'],
['The_Trip', 'The Hotel', 'to relax', 'se relaxer'],
['The_Trip', 'The Hotel', 'to go shopping', 'faire du shopping'],

# ['The_Trip', 'The Beach', 'beach', 'la playa'],
['The_Trip', 'The Beach', 'sand', 'le sable'],
['The_Trip', 'The Beach', 'water', 'l\'eau'],
['The_Trip', 'The Beach', 'sandals', 'les sandales'],
['The_Trip', 'The Beach', 'sunscreen', 'la crème solaire'],
['The_Trip', 'The Beach', 'palm tree', 'le palmier'],
['The_Trip', 'The Beach', 'waves', 'les vagues'],
['The_Trip', 'The Beach', 'seashells', 'les coquillages '],
['The_Trip', 'The Beach', 'sailboat', 'le bateau à voiles'],
['The_Trip', 'The Beach', 'lifeguard', 'le gardien de plage'],
['The_Trip', 'The Beach', 'to fish', 'pêcher'],
['The_Trip', 'The Beach', 'to swim', 'nager'],
['The_Trip', 'The Beach', 'to play', 'jouer'],

# End of Words - French
]


# Word.delete_all
# Words - Spanish
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
['The_Trip', 'The Beach', 'to play', 'jugar']
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


# words.each do |line|
#   Theme.find_or_create_by_name(line[0])
#   Subtheme.find_or_create_by_name_english(line[1])
# 
#   theme = line[0].lstrip.downcase
#   # theme = line[0].gsub('The', '').lstrip.downcase
#   subtheme = line[1].gsub('The', '').lstrip.downcase.tr(" ", "_")
#   word_english = line[2]
#   filename = line[2].tr(" ", "_")
# 
#   word_spanish = line[3]
#   Word.create!(
#     :image => server_prefix + 'theme_' + theme + '/subtheme/word_images/images_' + subtheme + '/' + filename + '.jpg',
#     :mp3 => server_prefix + 'theme_' + theme + '/subtheme/word_audio/audio_' + subtheme + '/' + filename + '.mp3',
#     :pdf => server_prefix + 'theme_' + theme + '/subtheme/word_pdfs/pdfs_' + subtheme + '/' + filename + '_' + theme + '_spanish.pdf',
#     :name => word_spanish,
#     :name_english => word_english,
#     :subtheme_id => Subtheme.find_by_name_english(line[1]).id
#   )
# end

