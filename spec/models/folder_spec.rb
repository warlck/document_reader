require 'spec_helper'

describe Folder do
  it { should belong_to :library}
  it { should have_many(:documents).dependent(:destroy)}
  it { should validate_presence_of(:name)}
end
