class Api::V1::WorksheetsController < ApplicationController
  respond_to :json

  def index
    render json: Worksheet.all
  end

  def show
    render json: Worksheet.find(params[:id])
  end
end
