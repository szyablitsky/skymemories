require 'spec_helper'

RSpec.describe ApplicationHelper, type: :helper do
  
  context 'page_title set' do
    it { expect(title '!').to eq 'Sky Memories | !' }
  end

  context 'page_title not set' do
    it { expect(title '').to eq 'Sky Memories' }
  end

end
