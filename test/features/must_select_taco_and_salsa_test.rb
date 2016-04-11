require 'test_helper'

feature 'Must select taco and salsa' do
  scenario 'Errors displayed if both taco and salsa are not selected ', js: true do
    visit '/'
    page.must_have_content 'Tacos:'
    page.must_have_content 'Salsas:'
    page.must_have_content 'Broiled_Buffalo'
    page.must_have_content 'Gooeyduck_Stomper'
    page.wont_have_content "That's All Folks!"
    page.find(:xpath, "//input[@name='salsa_ids[]'][@value='1']").set(true)
    click_button 'Search'
    page.has_content? 'Select a Taco or 2'
    page.find(:xpath, "//input[@name='salsa_ids[]'][@value='1']").set(false)
    page.find(:xpath, "//input[@name='taco_ids[]'][@value='1']").set(true)
    click_button 'Search'
    page.has_content? 'Grab some Salsa!'
  end
end
