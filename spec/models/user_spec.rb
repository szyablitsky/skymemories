require 'spec_helper'

describe User do
  
  it { should have_many :posts }

  it { should respond_to(:authenticate) }

  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most(50) }
  
  it { should validate_presence_of :email }
#  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should ensure_length_of(:password).is_at_least(6) }

end
