require 'rails_helper'

feature 'user adds a new manufacturer', %Q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
) do

# Acceptance Criteria:
# • I must specify a manufacturer name and country.
# • If I do not specify the required information, I am presented with errors.
# • If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

  before :each do
    visit new_manufacturer_path
  end

  scenario 'user adds a new manufacturer' do
    manufacturer = FactoryGirl.create(:manufacturer)

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Create Manufacturer'

    # expect(page).to have_content 'Success'
    expect(page).to have_content manufacturer.name
    expect(page).to have_content manufacturer.country
  end

  scenario 'user enters incomplete manufacturer info' do
    click_on 'Create Manufacturer'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "Error"
  end
end
