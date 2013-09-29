class Word < ActiveRecord::Base
  attr_accessible :image, :mp3, :name, :name_english, :name_image, :pdf, :subtheme_id

  belongs_to :subtheme

  has_one :theme, :through => :subtheme
  has_one :language, :through => :theme
  # validates :name, :uniqueness => true
  #belongs_to :language, :through => :theme

  #has_and_belongs_to_many :subthemes
end
