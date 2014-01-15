class DocumentsController < ApplicationController 

	def new
		@document = current_user.library.documents.new
		if params[:folder_id]
			@current_folder = current_user.folders.find(params[:folder_id])
			@document.folder_id = @current_folder.id
		end
	end

	def create
		@document = current_user.library.documents.new(params[:document])
		if @document.save
			if @document.folder
				redirect_to browse_path(@document.folder)
			else
				redirect_to library_path current_user.library
			end
		else
			render :new
		end
	end



	def destroy
		document = current_user.documents.find(params[:id])
		document.destroy if document
		redirect_to library_path(current_user.library)
	end


	def get
		document = current_user.documents.find_by_id(params[:id])
		if document 
			data = open(document.uploaded_file.url)
		    send_data data, :filename => document.file_name , :type => document.uploaded_file_content_type, :x_sendfile=>true 
		else
		    flash[:error] = "Don't have access to this file!"
		    redirect_to root_url
		end
	end

end