class LibrariesController <  ApplicationController 
	before_filter :authenticate_user!
	def show
	   @lib = Library.find(params[:id])	
	   @documents = @lib.documents
	end
end