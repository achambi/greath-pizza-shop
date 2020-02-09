require 'securerandom'

class Api::V1::TypesController < ApplicationController
  before_action :set_api_v1_type, only: [:show, :update, :destroy]

  # GET /api/v1/types
  def index
    @api_v1_types = Type.all

    render json: @api_v1_types
  end

  # GET /api/v1/types/1
  def show
    render json: @api_v1_type
  end

  # POST /api/v1/types
  def create
    parameters = api_v1_type_params
    puts JSON.pretty_generate(parameters.permitted?)
    puts JSON.pretty_generate(parameters)
    @api_v1_type = Type.new(parameters)
    @api_v1_type.id = SecureRandom.uuid
    if @api_v1_type.save
      json_response(@api_v1_type, :created)
    else
      render json: @api_v1_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/types/1
  def update
    if @api_v1_type.update(api_v1_type_params)
      render json: @api_v1_type
    else
      render json: @api_v1_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/types/1
  def destroy
    @api_v1_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_type
    @api_v1_type = Type.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def api_v1_type_params
    params.require(:type).permit(:name)
  end
end
