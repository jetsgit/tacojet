require 'test_helper'

feature 'Must display stores where lunch can be purchased after selectin tacos and salsa' do
  scenario 'Hungry dude/dudess selects tacos/salsas and is displayed list of stores and cities' do
    visit '/'
    page.find(:xpath, "//input[@name='salsa_ids[]'][@value='1']").set(true)
    page.find(:xpath, "//input[@name='salsa_ids[]'][@value='2']").set(true)
    page.find(:xpath, "//input[@name='salsa_ids[]'][@value='3']").set(true)
    page.find(:xpath, "//input[@name='taco_ids[]'][@value='1']").set(true)
    page.find(:xpath, "//input[@name='taco_ids[]'][@value='2']").set(true)
    page.find(:xpath, "//input[@name='taco_ids[]'][@value='3']").set(true)
    click_button 'Search'
    page.has_content? 'Stores with Requested Tacos and Salsas'
    page.has_content? 'Store'
    page.has_content? 'City'
    page.has_content? 'El_Gordo'
    page.has_content? 'Olympia'
  end
end
