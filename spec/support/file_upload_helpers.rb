module FileUploadHelpers

	def upload_file name = "unix-programming.pdf"
		click_link "Upload"
	    attach_file "document_uploaded_file", "#{Rails.root}/public/#{name}"
		click_button "Upload"
	end

end


RSpec.configure do |config|
	config.include FileUploadHelpers
end