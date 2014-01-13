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


	def get
		document = current_user.documents.find_by_id(params[:id])
		if document 
		    send_file document.uploaded_file.path, :type => document.uploaded_file_content_type, :x_sendfile=>true 
		else
		    flash[:error] = "Don't have access to this file!"
		    redirect_to root_url
		end
	end
end