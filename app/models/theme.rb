class Theme < ActiveRecord::Base
  attr_accessible :name, :name_english, :image, :pdf, :language_id, :description
  belongs_to :language
  has_many :subthemes
end
