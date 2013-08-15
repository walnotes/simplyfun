class LanguageTable < ActiveRecord::Base
  attr_accessible :language_id, :subtheme, :subtheme_description, :subtheme_id, :subtheme_image, :subtheme_pdf_flashcards, :subtheme_pdf_worksheet, :theme, :theme_description, :theme_id, :theme_image, :theme_pdf, :word, :word_audio, :word_id, :word_image, :word_pdf

  belongs_to :language
  belongs_to :theme
  belongs_to :subtheme
  belongs_to :word
end
