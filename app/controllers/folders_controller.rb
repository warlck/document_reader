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
        	redirect_to_parent @folder
		else
			render :new
		end
	end

	def edit
		@folder = current_user.folders.find(params[:folder_id])
		@current_folder = @folder.parent
	end

	def update
		@folder = current_user.library.folders.find(params[:id])
		@folder.update_attributes(params[:folder])
		if @folder.save
			redirect_to_parent @folder
		else 
			render :edit
		end
	end


	def destroy
		@folder = current_user.folders.find(params[:id])
		@parent_folder = @folder.parent
		@folder.destroy if @folder
		redirect_to_parent @folder
	end



	private 
	  def redirect_to_parent folder
	  	   if folder.parent
				redirect_to browse_path(folder.parent)
		   else 
				redirect_to library_path(current_user.library)
		   end
	  end
end

