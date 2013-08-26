class Word < ActiveRecord::Base
  attr_accessible :image, :mp3, :name, :name_english, :name_image, :pdf
  #belongs_to :language, :through => :theme

  #has_and_belongs_to_many :subthemes
end
