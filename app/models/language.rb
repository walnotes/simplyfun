class Language < ActiveRecord::Base
  attr_accessible :description, :name, :name_english, :language_identifier
  has_many :themes
end
