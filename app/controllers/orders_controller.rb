class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :set_plates
  before_action :set_clients

  def index
    if require_user or authenticated_user
    else
      @orders = Order.all
    end
  end

  def show
    if require_user or authenticated_user
    end
  end

  def new
    if require_user or authenticated_user
    else
      @order = Order.new
    end
  end

  def edit
    if require_user or authenticated_user
    end
  end

  def create

    if require_user or authenticated_user
    else
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  def update
    if require_user or authenticated_user
      else
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  def destroy
    if require_user or authenticated_user
      else
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def set_plates
      @plates = Plate.all.map{|plate| ["#{plate.name} - #{plate.price}", plate.id]}
    end

    def set_clients
      @clients = Client.all.map{|client| ["#{client.name} - #{client.email} - #{client.password} - #{client.direction}", client.id]}
    end
    
    def order_params
      params.require(:order).permit(:order_date, :status, :plate_id, :client_id)
    end
end
