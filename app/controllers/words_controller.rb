class WordsController < ApplicationController
	before_filter :authenticate_user!
	def show
		if params[:word_id]
			@language = Language.find(params[:language_id])
			@theme = Theme.find(params[:language_id])
			@subtheme = Subtheme.find(params[:subtheme_id])
  			@word = Word.find(params[:word_id])
  		else
  			@word = Word.find(params[:id])
  		end

	end
end
