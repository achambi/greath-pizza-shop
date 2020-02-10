# frozen_string_literal: true

class OrderController < ApplicationController
  # GET /order
  def index
    @orders = Order.all
    json_response(@orders)
  end
end
