require 'spec_helper'

describe "users/new" do

  before { assign(:user, stub_model(User).as_new_record) }

  it "renders register form" do
    render
    response.should have_content 'Регистрация'
  end

end
