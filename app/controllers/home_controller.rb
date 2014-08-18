class HomeController < ApplicationController
  before_filter :authenticate_user, :only => [:index]

  def index
  end

  def welcome
    render 'home/welcome'
  end

  protected

  def authenticate_user
    unless (current_student || current_teacher)
      reset_session
      redirect_to :welcome
    end
  end
end
