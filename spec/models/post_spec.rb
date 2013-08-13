require 'spec_helper'

describe Post do

  it { should belong_to :user }
  it { should validate_presence_of :user_id }
  
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }

  it { should validate_presence_of :content }

end
