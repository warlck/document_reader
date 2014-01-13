class DocumentsController < ApplicationController 

	def new
		@document = Document.new
	end

	def create
		@library = current_user.library
		@document = Document.new
		@document.update_attributes(params[:document])
		if @document.save
			@library.documents << @document
			redirect_to library_path @library
		else
			render :new
		end
	end
end