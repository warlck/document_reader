require 'spec_helper'

describe Document do
  it { should belong_to :library}
  it { should belong_to :folder}




  describe "paperlcip attachment" do
  	subject { Document.create}

  	it { should have_attached_file(:uploaded_file) }
	  it { should validate_attachment_presence(:uploaded_file) }
	  it { should validate_attachment_content_type(:uploaded_file).
	                allowing('application/pdf') }
	  it { should validate_attachment_size(:uploaded_file).
	                less_than(10.megabytes) }
  end

  describe "#file_name" do
     it "returns the file name of attachment" do
        document = create(:document, :uploaded_file_file_name => "newname")
        expect(document.file_name).to eq "newname"
     end
  end

  describe "#file_size" do
     it "returns the correct file size of attachment" do
         document = create(:document, :uploaded_file_file_size => 10000)
         expect(document.file_size).to eq 10000
     end
  end

  


end
