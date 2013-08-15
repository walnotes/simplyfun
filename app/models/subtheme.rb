class Subtheme < ActiveRecord::Base
  attr_accessible :image, :name, :name_english, :pdf_flashcards, :pdf_worksheet, :description, :video_url, :theme_id
  belongs_to :theme
  has_and_belongs_to_many :words
end
