class Auth::SessionsController < ApplicationController
  
  def new_teacher
    render 'sessions/teacher_login'
  end

  def create_teacher
    teacher = Teacher.find_by(email: params[:teacher][:email]) if Teacher.exists?(email: params[:teacher][:email])
    if teacher && teacher.authenticate(params[:teacher][:password])
      session[:user_id] = teacher.id
      session[:user_type] = 'teacher'
      redirect_to root_path
    else
      redirect_to auth_teacher_login_path
    end
  end

  def new_student
    render 'sessions/student_login'
  end

  def create_student
    student = Student.find_by(username: params[:student][:username]) if Student.exists?(username: params[:student][:username])
    if student && student.authenticate(params[:student][:password])
      session[:user_id] = student.id
      session[:user_type] = 'student'
      redirect_to root_path
    else
      redirect_to auth_student_login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end