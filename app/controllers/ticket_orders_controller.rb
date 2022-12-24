#---
# Excerpted from "Modern Front-End Development for Rails, Second Edition",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/nrclient2 for more book information.
#---
class TicketOrdersController < ApplicationController
  before_action :set_ticket_order, only: %i[show edit update destroy]

  # GET /ticket_orders or /ticket_orders.json
  def index
    @ticket_orders = TicketOrder.all
  end

  # GET /ticket_orders/1 or /ticket_orders/1.json
  def show
  end

  # GET /ticket_orders/new
  def new
    @ticket_order = TicketOrder.new
  end

  # GET /ticket_orders/1/edit
  def edit
  end

  # POST /ticket_orders or /ticket_orders.json
  def create
    @ticket_order = TicketOrder.new(ticket_order_params)

    respond_to do |format|
      if @ticket_order.save
        format.html { redirect_to @ticket_order, notice: "Ticket order was successfully created." }
        format.json { render :show, status: :created, location: @ticket_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_orders/1 or /ticket_orders/1.json
  def update
    respond_to do |format|
      if @ticket_order.update(ticket_order_params)
        format.html { redirect_to @ticket_order, notice: "Ticket order was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_orders/1 or /ticket_orders/1.json
  def destroy
    @ticket_order.destroy
    respond_to do |format|
      format.html { redirect_to ticket_orders_url, notice: "Ticket order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket_order
    @ticket_order = TicketOrder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ticket_order_params
    params.require(:ticket_order).permit(:concert_id, :statusinteger, :scount, :shopping_cart_id)
  end
end
