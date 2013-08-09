Given(/^a user visits the signin page$/) do
  visit login_path
end

When(/^he submits invalid signin information$/) do
  click_button "Войти"
end

Then /^he should see an error message$/ do
  expect(page).to have_selector('div.flash-message.error')
end

Given(/^the user has an account$/) do
  @user = FactoryGirl.create(:user)
end

When(/^the user submits valid signin information$/) do
  fill_in "Адрес",    with: @user.email
  fill_in "Пароль", with: @user.password
  click_button "Войти"
end

Then(/^he should see his profile page$/) do
  expect(page).to have_title(@user.name)
end

Then(/^he should see a signout link$/) do
  expect(page).to have_link('Выйти', href: logout_path)
end