class ThemesController < ApplicationController
	before_filter :authenticate_user!
	def show
		@theme = Theme.find(params[:id])
	end	
end
