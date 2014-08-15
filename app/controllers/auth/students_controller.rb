class Auth::StudentsController < ApplicationController
  def new
    if current_student
      redirect_to(root_path)
    else
      @student = Student.new
      render 'students/new'
    end
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      session[:user_id] = @student.id
      session[:user_type] = 'student'
      redirect_to root_path
    else
      render 'students/new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :username, :security_question, :security_answer, :password, :password_confirmation)
  end
end