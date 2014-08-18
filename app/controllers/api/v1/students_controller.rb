class Api::V1::StudentsController < ApplicationController
  respond_to :json

  def index
    if current_teacher
      render json: current_teacher.students
    else
      render json: {:error => "Invalid Login Details"}, status: 401
    end
  end

  def show
    render json: student
  end

  private

  def student
    Student.find(params[:id])
  end

end
