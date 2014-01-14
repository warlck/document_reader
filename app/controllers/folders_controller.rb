class FoldersController < ApplicationController
	before_filter :authenticate_user!
	
	def new
		@folder = current_user.library.folders.new
		if params[:folder_id]
			@current_folder = current_user.folders.find(params[:folder_id])
			@folder.parent_id = @current_folder.id
		end
	end

	def create
		@folder  = current_user.library.folders.new(params[:folder])
        if @folder.save
        	if @folder.parent
        		redirect_to browse_path(@folder.parent)
        	else
				redirect_to root_url
			end
		else
			render :new
		end
	end
end