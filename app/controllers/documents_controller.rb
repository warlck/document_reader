class DocumentsController < ApplicationController 

   def index
   	 @documents = Document.all
   end

	def new
		@document = Document.new
	end

	def create
		@document = Document.new
		@document.update_attributes(params[:document])
		if @document.save
			redirect_to documents_path
		else
			render :new
		end
	end
end