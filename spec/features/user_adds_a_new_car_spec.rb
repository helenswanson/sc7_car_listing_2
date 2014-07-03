require 'rails_helper'

feature 'user adds a new car', %Q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
) do

# Acceptance Criteria:
# • I must specify the manufacturer, color, year, and mileage of the car.
# • Only years from 1920 and above can be specified.
# • I can optionally specify a description of the car.
# • If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success
# • If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# • Upon successfully creating a car, I am redirected back to the index of cars.

  before :each do
    @manufacturer = FactoryGirl.create(:manufacturer)
    visit manufacturer_path(@manufacturer)
  end

  context 'user completes all required fields' do
    let(:car) { FactoryGirl.build(:car) }

    before :each do
      fill_in 'Make', with: car.make
      fill_in 'Car model', with: car.car_model
      fill_in 'Color', with: car.color
      fill_in 'Mileage', with: car.mileage
      fill_in 'Description', with: car.description
    end

    scenario 'user completes required fields with valid year' do
      fill_in 'Year', with: car.year
      click_on 'Create Car'

      expect(page).to have_content 'Success'
      expect(page).to have_content car.make
      expect(page).to have_content car.car_model
      expect(page).to have_content car.color
      expect(page).to have_content car.year
      expect(page).to have_content car.mileage
    end

    scenario 'user completes required fields with invalid year' do
      fill_in 'Year', with: 1919
      click_on 'Create Car'

      expect(page).to_not have_content 'Success'
      expect(page).to have_content "Error"
    end
  end

  scenario 'user enters incomplete car info' do
    click_on 'Create Car'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "Error"
  end
end
