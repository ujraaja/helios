Given(/^I am on the (.+) page$/) do |page_name|
  visit path_to(page_name)
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, field|
  select value, from: field
end

When(/^I fill in "([^"]*)" for "([^"]*)"$/) do |value, field|
  fill_in(field, :with => value)
end

When(/^I follow "([^"]*)"$/) do |link|
  click_link(link)
end

Then(/^I should see a "([^"]*)"$/) do |field|
  expect(page).to have_xpath("//#{field}")
end

Then(/^I should see a "([^"]*)" input labeled "([^"]*)"$/) do |type, label|
  expect(page).to have_xpath("//input[@value='#{label}']")
end

Then(/^I should see a "([^"]*)" input with id "([^"]*)"$/) do |type, value|
  expect(page).to have_xpath("//input[@id='#{value}']")
end

Then(/^I should see a link with href "([^"]*)"$/) do |path|
  expect(page).to have_xpath("//a[@href='#{path}']")
end

Then(/^A download should commence$/) do
  pending 
end

Then(/^I should be on the (.+) page$/) do |page_name|
  uri = URI.parse(current_url)
  "#{uri.path}".should == path_to(page_name)
end

Then(/^I should see "([^"]*)"$/) do |text|
  page.should have_content(text)
end

Then(/^I expect to see "([^"]*)" selected from "([^"]*)"$/) do |option, field|
  expect(page).to have_select(field, selected: option)
end
