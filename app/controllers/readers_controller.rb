class ReadersController < ApplicationController
	def show
		lib = current_user.library
		@documents = lib.documents.where(folder_id: nil)
		@folders = lib.folders.roots
	end

	def read
		@document = current_user.documents.find(params[:id])
	end
end