class Api::V1::ResponsesController < ApplicationController
  respond_to :json

  def index
    render json: Response.all
  end

  def show
    render json: Response.find(params[:id])
  end
end
