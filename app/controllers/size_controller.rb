class SizeController < ApplicationController
  # GET /size
  def index
    @sizes = Size.all
    json_response(@sizes)
  end
end
