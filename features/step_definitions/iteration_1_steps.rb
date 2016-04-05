Given(/^I am on the (.+) page$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see a "([^"]*)"$/) do |field|
  expect(page).to have_xpath("//" + field)
end

Then(/^I should see a "([^"]*)" input labeled "([^"]*)"$/) do |type, label|
  expect(page).to have_xpath("//input[@value='" + label + "']")
end

Then(/^I should see a "([^"]*)" input with id "([^"]*)"$/) do |type, value|
  expect(page).to have_xpath("//input[@id='" + value + "']")
end

Then(/^I should see a link with href "([^"]*)"$/) do |path|
  expect(page).to have_xpath("//a[@href='" + path + "']")
end