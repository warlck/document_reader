require 'spec_helper'

describe Folder do
  it { should belong_to :library}
  it { should have_many :documents}
end
