require 'spec_helper'

describe Movie do
  it { should validate_presence_of :vimeo_id }
end
