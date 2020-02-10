# frozen_string_literal: true

class OrderController < ApplicationController

  # GET /order
  def index
    @orders = Order.all
    json_response(@orders)
  end

  # POST /pizza-type
  def create
    set_order
    @order.save!
    json_response(@order, :created)
  end


  private

  def set_order
    @order = Order.new
    size = Size.find(params[:size_id])
    @order.type = PizzaType.find(params[:type_id])
    @order.cheese = Option.find(params[:cheese_id])
    @order.sauce = Option.find(params[:sauce_id])
    @order.crust = Option.find(params[:crust_id])
    @order.status = Status.find(params[:status_id])
    @order.size = size
    params.key?(:slices) ? @order.slices = params[:slices] : @order.slices = size.slices
    @order
  end
end
