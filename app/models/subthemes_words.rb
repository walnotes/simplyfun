class SubthemesWords < ActiveRecord::Base
  attr_accessible :image, :mp3, :pdf, :subtheme_id, :word_english, :word_foreign, :word_foreign_image, :word_id
  belongs_to :subtheme
  belongs_to :word
end