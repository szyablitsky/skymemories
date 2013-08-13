require 'spec_helper'

describe Movie do
  
  it { should validate_presence_of :vimeo_id }
  it { should validate_numericality_of :vimeo_id }
  it { should validate_uniqueness_of :vimeo_id }
  
  it { should validate_presence_of :locale }
  it { should ensure_inclusion_of(:locale).in_array LOCALES }

  let(:movie) { FactoryGirl.create(:movie) }

  it "has a valid factory" do
    movie.should be_valid
  end

  

end
