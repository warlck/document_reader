require 'spec_helper'


describe DocumentsController do
	before(:each) do
	       @user = create(:user)
		   @request.cookies[:auth_token] = @user.auth_token
		   @document = create(:document)
		   @user.library.documents << @document
	end

	describe "DELETE #destroy"  do
		it "deletes document" do
			expect{ delete :destroy, id: @document}.
			to change(@user.documents, :count).by(-1)
		end

		it	'empties library' do
			delete :destroy, id: @document
			expect(@user.library.documents).to be_empty
		end
	end


	
end