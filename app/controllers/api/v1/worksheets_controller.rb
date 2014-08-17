class Api::V1::WorksheetsController < ApplicationController
  respond_to :json

  def index
    render json: Worksheet.all
  end

  def show
    render json: Worksheet.find(params[:id])
  end

  def update
    @worksheet = Worksheet.find(params[:id])
    @worksheet.update_attributes(input_fields: params[:worksheet][:input_fields])
    render :nothing => true, :status => 200
  end
end
