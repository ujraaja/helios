Given(/^I am on the (.+) page$/) do |page_name|
  visit path_to(page_name)
end

Given(/^I select "([^"]*)" to be uploaded to "([^"]*)"$/) do |path, field|
  attach_file(field, File.expand_path(path))
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

When(/^I wait "([^"]*)" seconds to press "([^"]*)"$/) do |sec, button|
  sleep(Integer(sec))
  click_button(button)
end

When(/^I press button with id "([^"]*)"$/) do |button|
  page.execute_script("$(\"##{button}\").trigger(\"click\")") 
end

When(/^I select anything from "([^"]*)"$/) do |field|
  option = first('#queryList option').text
  select option, from: field
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, field|
  select value, from: field
end

When(/^I fill in "([^"]*)" for "([^"]*)"$/) do |value, field|
  fill_in(field, with: value)
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

Then(/^I should see a select with id "([^"]*)"$/) do |id|
  expect(page).to have_xpath("//select[@id='#{id}']")
end

Then(/^I should not see a select with id "([^"]*)"$/) do |id|
  expect(page).to have_no_xpath("//select[@id='#{id}']")
end

Then(/^I should see a link labeled "([^"]*)"$/) do |label|
  expect(page).to have_css("a", text: label)
end

Then(/^A download should commence$/) do
  #page.response_headers['Content-Disposition'].should include("filename=\"CSV.csv\"")
  header = page.response_headers['Content-Disposition']
  header.should (match (/^attachment/))
end

Then(/^I should be on the (.+) page$/) do |page_name|
  uri = URI.parse(current_url)
  "#{uri.path}".should == path_to(page_name)
end

Then(/^I should see "([^"]*)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "([^"]*)"$/) do |text|
  page.should have_no_content(text)
end

Then(/^I expect to see "([^"]*)" selected from "([^"]*)"$/) do |option, field|
  expect(page).to have_select(field, selected: option)
end

When(/^I expect to see "([^"]*)" for input "([^"]*)"$/) do |value, field|
  page.should have_xpath("//input[@value='#{value}']")
end

When(/^I wait for "([^"]*)" seconds$/) do |value|
  sleep(Integer(value))
end
