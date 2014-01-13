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
end
