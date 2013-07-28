require 'spec_helper'

describe ApplicationHelper do
  
  context 'page_title set' do
    it { title('!').should == 'Sky Memories | !' }
  end

  context 'page_title not set' do
    it { title('').should == 'Sky Memories' }
  end

end
