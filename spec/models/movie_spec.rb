require 'spec_helper'

describe Movie do
  it { should validate_presence_of :vimeo_id }
  it { should validate_presence_of :locale }
  it { should ensure_inclusion_of(:locale).in_array %w( en ru hb ) }
end
