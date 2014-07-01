FactoryGirl.define do
  factory :manufacturer do
    name 'Honda'
    country 'Japan'
  end

  factory :car do
    make 'Civic'
    car_model 'Honda'
    color 'silver'
    mileage 75000
    year 2001
    description 'This is a car.'
    manufacturer_id 1
  end
end

