class Car < ActiveRecord::Base
  validates :make, presence: true
  validates :car_model, presence: true
  validates :color, presence: true
  validates :year, presence: true, inclusion: { within: 1920..Time.now.year }
  validates :mileage, presence: true

  belongs_to :manufacturer
end
