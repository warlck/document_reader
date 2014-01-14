require 'spec_helper'

feature 'User creating document by uploading pdf' do
	let(:user) { create(:user)}	
	before(:all) do 
		 @default_options = Paperclip::Attachment.default_options.deep_dup
		 Paperclip::Attachment.default_options.merge!({
		:storage => :s3,
	    :s3_protocol => 'http',
	    :s3_host_name   => "s3-ap-southeast-1.amazonaws.com",
	    :s3_credentials => {
	      :bucket => ENV['AWS_BUCKET'],
	      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
	      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	    }}) 
		log_in user
	 	visit new_document_path 
	end
	after(:all) { Paperclip::Attachment.default_options = @default_options }

	 scenario 'is successful when  valid file is used', :slow do 	
	 	expect(page).to have_content "Upload Document"
	 	attach_file "document_uploaded_file", "#{Rails.root}/public/unix-programming.pdf"
	 	click_button "Upload"
	 	expect(current_path).to eq library_path user.library
	 	expect(page).to have_css '.document'
	 	expect(page).to have_content "unix-programming"
	 	click_link 'unix-programming.pdf'
	 	expect(page.response_headers['Content-Type']).to eq 'application/pdf'
	 end

	 scenario "is unsuccessfull when no file is chosen" do
         click_button "Upload"
         expect(page).to have_content "Upload Document"
         expect(page).to have_content "Uploaded file can't be blank"
	 end



	
end