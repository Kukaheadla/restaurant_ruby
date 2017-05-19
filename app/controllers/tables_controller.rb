class TablesController < ApplicationController
  def edit
  end

  def create
    (1..params[:table_num].to_i).each do |d|
      @table = Table.new
      @table.table_no = d
      @table.user_id = params[:user_id]
      @table.save
    end
    redirect_to '/home'
  end

  def summary
    @table = Table.find_by(table_no: params.fetch(:id), user_id: current_user.id)
    @dishes = Dish.all
    @orders = []
    @dishes.each do |d|
      if d.table_id == @table.table_no && d.user_id == @table.user_id
        @orders << d
      end
    end

    @options = []
    @dishes.each do |d|
      if d.user_id == current_user.id
        @options << d.name
      end
    end

    @sum = 0
    (0..@orders.length-1).each do |index|
      @sum += @orders[index].price * @orders[index].quantity
    end
  end

  def add_order
    @table = Table.find_by(table_no: params.fetch(:id), user_id: current_user.id)
    @id = params.fetch(:id)
    @dish = Dish.find_by(name: params[:dish])
    @dish.update_attribute(:table_id, @table.table_no)

    if @dish.quantity == nil
      @dish.update_attribute(:quantity, 1)
    elsif @dish.quantity != nil
      @increment = @dish.quantity + 1
      @dish.update_attribute(:quantity, @increment)
    end

    redirect_to '/tables/'+ @id
  end

  def delete_order
    @dish = Dish.find_by(name: params[:tb_dish_name])
    @dish.update_attribute(:quantity, nil)
    @dish.update_attribute(:table_id, nil)
    @id = params.fetch(:id)
    redirect_to '/tables/'+ @id
  end

  def paid
    puts'Test3'
    puts @input_arr = params[:paying_orders].split(',')
    (0..@input_arr.length-1).each do |p|
      @paid_dish = Dish.find_by(name: @input_arr[p])
      @paid_dish.update_attribute(:quantity, nil)
      @paid_dish.update_attribute(:table_id, nil)
    end

    @id = params.fetch(:id)
    redirect_to '/tables/'+ @id
  end
end
