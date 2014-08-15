class AuthController < ApplicationController

  def teacher
    puts params

    user = Teacher.find_by(username: params['username'])

    if user && user.authenticate(params['password'])
      session[:user_id] = user.id
      session[:user_type] = 'teacher'

      render json: { :user_id => user.id }
    else
      render json: { :error => "Invalid username/password" }, status: 401
    end

  end


  def student

  end

end