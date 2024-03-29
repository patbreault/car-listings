class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Car saved!"
      redirect_to @car
    else
      flash[:notice] = "Car not saved! See below for errors."
      render :new
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def index
    @cars = Car.all
  end

  protected

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :manufacturer_id, :description)
  end


end
