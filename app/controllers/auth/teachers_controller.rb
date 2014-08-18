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
    @teacher.class_code = new_code
    if @teacher.save
      session[:user_id] = @teacher.id
      session[:user_type] = 'teacher'
      redirect_to root_path
    else
      @errors = @teacher.errors.full_messages
      render 'teachers/new'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def random_code
    letters = ('1'..'9').to_a + ('A'..'N').to_a + ('P'..'Z').to_a
    random = letters.shuffle[0,6]
    random[0..2].join + "-" + random[3..5].join
  end

  def new_code
    new_code = ""
    loop do
      new_code = random_code
      break unless Teacher.exists?(class_code: new_code)
    end
    return new_code
  end
end