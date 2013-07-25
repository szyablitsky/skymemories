Given(/^there is a movies$/) do
  @movies = FactoryGirl.create_list(:movie,2)
end

When(/^I visit movies page$/) do
  visit movies_path
end

Then(/^I should see all movies$/) do
  page.should have_content('222111001')
  page.should have_content('222111002')
end
