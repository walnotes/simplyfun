class SubthemesController < ApplicationController
	before_filter :authenticate_user!
	def show
		@subtheme = Subtheme.find(params[:id])
  	end
end
