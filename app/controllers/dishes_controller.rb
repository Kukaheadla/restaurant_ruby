class DishesController < ApplicationController
  def new
  end

  def create
    @dish = Dish.new
    @dish.name = params[:dish]
    @dish.price = params[:price]
    @dish.user_id =params[:user_id]
    if @dish.save
      redirect_to '/home'
    else
      render :new
    end
  end

  def list
    @dishes = Dish.all
  end
end
