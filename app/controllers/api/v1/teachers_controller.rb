class Api::V1::TeachersController < ApplicationController
  respond_to :json

  def index
    respond_with Teacher.all
  end

  def show
    if(current_teacher)
      render current_teacher
    else
      render {error: "You must be logged in"}, status: 401
    end
  end

  def create
    respond_with :api, :v1, Teacher.create(teacher_params)
  end

  private

  def teacher
    Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:lead).permit(:first_name, :last_name, :username, :email, :security_question, :security_answer, :password, :password_confirmation)
  end

end