class PizzaTypeController < ApplicationController
  before_action :set_pizza_type, only: [:show, :update, :destroy]

  # GET /pizza-types
  def index
    @pizza_types = PizzaType.all
    json_response(@pizza_types)
  end

  # POST /pizza-type
  def create
    @pizza_type = PizzaType.create!(pizza_type_params)
    json_response(@pizza_type, :created)
  end

  # GET /pizza-type/:id
  def show
    json_response(@pizza_type)
  end

  # PUT /pizza-type/:id
  def update
    @pizza_type.update(pizza_type_params)
    head :no_content
  end

  # DELETE /pizza-type/:id
  def destroy
    @pizza_type.destroy
    head :no_content
  end

  private

  def pizza_type_params
    # whitelist params
    params.permit(:name)
  end

  def set_pizza_type
    @pizza_type = PizzaType.find(params[:id])
  end
end
