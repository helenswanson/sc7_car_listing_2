class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @car = Car.new
    @cars = Car.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = 'Success'
      redirect_to manufacturer_path(@manufacturer)
    else
      flash.now[:notice] = 'Error'
      render :new
    end
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
