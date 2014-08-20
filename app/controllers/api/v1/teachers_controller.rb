class Api::V1::TeachersController < ApplicationController
  respond_to :json

  def index
    if current_teacher
      render json: Teacher.where(id: current_teacher.id)
    elsif current_student
      render json: Teacher.where(id: current_student.teacher.id)
    else
      render json: ({error: "You must be logged in"}), status: 401
    end
  end

  def show
    if current_teacher
      render json: current_teacher
    elsif current_student
      render json: current_student.teacher
    else
      render json: {:error => "Invalid Login Details"}, status: 401
    end
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update_attributes(update_teacher_params)
    puts '*' * 50
    puts @teacher.first_name
    puts @teacher.errors.full_messages
    render json: @teacher
  end

  private

  def update_teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :title, :email, :class_code)
  end

end
