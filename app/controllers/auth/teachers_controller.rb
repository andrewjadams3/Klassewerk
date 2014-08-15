class Auth::TeachersController < ApplicationController
  def new
    if current_teacher
      redirect_to(root_path)
    else
      @teacher = Teacher.new
      render 'teachers/new'
    end
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:user_id] = @teacher.id
      session[:user_type] = 'teacher'
      redirect_to root_path
    else
      render 'teachers/new'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end