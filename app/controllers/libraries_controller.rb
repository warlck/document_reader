class LibrariesController <  ApplicationController 
	def show
	   @lib = Library.find(params[:id])	
	   @documents = @lib.documents
	end
end