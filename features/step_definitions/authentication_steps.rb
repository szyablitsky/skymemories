Given(/^a user visits the signin page$/) do
  visit login_path
end

When(/^he submits invalid signin information$/) do
  click_button "Войти"
end

Then /^he should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-danger')
end

Given(/^the user has an account$/) do
  @user = FactoryGirl.create(:user)
end

When(/^the user submits valid signin information$/) do
  fill_in "Адрес", with: @user.email
  fill_in "Пароль", with: @user.password
  click_button "Войти"
end

Then(/^he should see his profile page$/) do
  expect(page).to have_title(@user.name)
end

Then(/^he should see a signout link$/) do
  expect(page).to have_link('Выйти', href: logout_path)
end

Given(/^the user is signed in$/) do
  step "a user visits the signin page"
  step "the user submits valid signin information"
end

When(/^the user signs out$/) do
  click_link "Выйти"
end

Then(/^he should see a signin link$/) do
  expect(page).to have_link('Вход', href: login_path)
end

Then(/^he should see home page$/) do
  page.should_not have_title(" | ")
end
