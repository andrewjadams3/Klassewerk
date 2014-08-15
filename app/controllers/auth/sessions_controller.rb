class Auth::SessionsController < ApplicationController
  
  def new_teacher
    render 'sessions/teacher_login'
  end

  def create_teacher
    teacher = Teacher.find_by(email: params[:session][:email]) if Teacher.exists?(email: params[:session][:email])
    if teacher && teacher.authenticate(params[:session][:password])
      session[:user_id] = teacher.id
      session[:user_type] = 'teacher'
      redirect_to root_path
    else
      render 'sessions/teacher_login'
    end
  end

  def new_student
    render 'sessions/student_login'
  end

  def create_student
    student = Student.find_by(username: params[:session][:username]) if Student.exists?(username: params[:session][:username])
    if student && student.authenticate(params[:session][:password])
      session[:user_id] = student.id
      session[:user_type] = 'student'
      redirect_to root_path
    else
      render 'sessions/student_login'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end