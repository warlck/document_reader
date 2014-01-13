require 'spec_helper'

describe Library do
   it { should belong_to(:user)}
   it {should have_many(:documents).dependent(:destroy)}
end
