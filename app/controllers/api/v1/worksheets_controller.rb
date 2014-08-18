class Api::V1::WorksheetsController < ApplicationController
  respond_to :json

  def index
    if current_teacher
      render json: current_teacher.worksheets
    elsif current_student
      render json: current_student.teacher.worksheets
    else
      render json: ({error: "You must be logged in"}), status: 401
    end
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
