class CarsController < ApplicationController
  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car.manufacturer = @manufacturer

    if @car.save
      flash[:notice] = "Success"
    else
      flash.now[:notice] = "Error"
    end
    redirect_to manufacturer_path(@manufacturer)
  end

  private
  def car_params
    params.require(:car).permit(:make, :car_model, :color, :year, :mileage, :description)
  end
end
