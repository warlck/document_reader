class LibrariesController <  ApplicationController 
	before_filter :authenticate_user!
	def show
	   @lib = current_user.library	
	   @documents = @lib.documents
	   @folders = @lib.folders
	end
end