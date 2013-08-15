class SubthemesController < ApplicationController
	def show
		@subtheme = Subtheme.find(params[:id])
  	end
end
