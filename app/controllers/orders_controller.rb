class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  before_action :authenticate_account!
  layout "dashboard"



  # GET /orders or /orders.json
  def index
    @orders = Order.order(created_at: :desc)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @customers = Customer.all
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @customers = Customer.all
  end

  # POST /orders or /orders.json
  def create
    @order = current_account.orders.build(order_params)

    respond_to do |format|
      if @order.save
        @orders = Order.all
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        @orders = Order.all
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @order = Order.find_by(uid: params[:order_id])
    end



  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:order_date, :customer_id, :transporter, :delivery_note_number, :entry_b3, :entry_b6, :entry_b12, :entry_b32, :entry_b38, :out_b3, :out_b6, :out_b12, :out_b32, :out_b38, :total_tonnage)
    end
end
