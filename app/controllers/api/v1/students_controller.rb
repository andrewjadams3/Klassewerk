class Api::V1::StudentsController < ApplicationController
  respond_to :json

  def index
    if current_teacher
      render json: current_teacher.students
    elsif current_student
      render json: Student.where(id: current_student.id)
    else
      render json: {:error => "Invalid Login Details"}, status: 401
    end
  end

  def show
    if current_teacher
      render json: current_teacher.students.find(params[:id])
    elsif current_student
      render json: current_student
    else
      render json: {:error => "Invalid Login Details"}, status: 401
    end
  end

  private

  def student
    Student.find(params[:id])
  end

end