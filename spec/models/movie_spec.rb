require 'spec_helper'

describe Movie do
  
  it { is_expected.to validate_presence_of :vimeo_id }
  it { is_expected.to validate_numericality_of :vimeo_id }
  it { is_expected.to validate_uniqueness_of :vimeo_id }
  
  it { is_expected.to validate_presence_of :locale }
  it { is_expected.to validate_inclusion_of(:locale).in_array LOCALES }

  let(:movie) { FactoryGirl.create(:movie) }

  it "has a valid factory" do
    expect(movie).to be_valid
  end

  

end
