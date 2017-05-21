# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApplicationHelper, type: :helper do
  context 'page_title set' do
    it { expect(title('!')).to eq 'Maevsky Pictures | !' }
  end

  context 'page_title not set' do
    it { expect(title('')).to eq 'Maevsky Pictures' }
  end
end
