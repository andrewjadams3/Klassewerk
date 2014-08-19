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
    if current_teacher
      render json: current_teacher.worksheets.find(params[:id])
    elsif current_student
      render json: current_student.teacher.worksheets.find(params[:id])
    else
      render json: ({error: "You must be logged in"}), status: 401
    end
  end

  def update
    @worksheet = Worksheet.find(params[:id])
    @worksheet.update_attributes(input_fields: params[:worksheet][:input_fields])
    render json: @worksheet
  end
end
