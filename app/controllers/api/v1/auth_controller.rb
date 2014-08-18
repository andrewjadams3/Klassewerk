class Api::V1::AuthController < ApplicationController
  respond_to :json

  def index
    if current_teacher
      render json: {type: 'teacher', id: current_teacher.id}
    elsif current_student
      render json: {type: 'student', id: current_student.id}
    else
      respond_with ({error: "You must be logged in"}), status: 401
    end
  end

end