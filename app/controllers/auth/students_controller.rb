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
    @student.teacher = Teacher.find_by(class_code: params[:class_code])
    if @student.save
      session[:user_id] = @student.id
      session[:user_type] = 'student'
      redirect_to root_path
    else
      @errors = @student.errors.full_messages
      render 'students/new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end
end