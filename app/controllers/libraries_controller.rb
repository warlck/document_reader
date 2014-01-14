class LibrariesController <  ApplicationController 
	before_filter :authenticate_user!
	def show
	   lib = current_user.library
	   @documents = lib.documents.where(folder_id: nil)
	   @folders = lib.folders.roots
	end

	def browse 
		@current_folder = current_user.folders.find(params[:folder_id])

		if @current_folder 
			@folders = @current_folder.children
		    @documents = @current_folder.documents
		    render :show
		else
			redirect_to root_url, alert: "You are not authorized to view this folder"
		end	
	end
end