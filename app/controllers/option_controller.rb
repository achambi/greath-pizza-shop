class OptionController < ApplicationController
  # GET /option
  def index
    @options = Option.all
    json_response(@options)
  end
end
