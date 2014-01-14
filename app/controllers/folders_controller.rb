class FoldersController < ApplicationController
	before_filter :authenticate_user!
	
	def new
		@folder = Folder.new
	end

	def create
		@folder  = current_user.library.folders.new(params[:folder])
        if @folder.save
			redirect_to root_url
		else
			render :new
		end
	end
end