class ReaderController < ApplicationController
	def show
		lib = current_user.library
		@documents = lib.documents.where(folder_id: nil)
		@folders = lib.folders.roots
	end
end