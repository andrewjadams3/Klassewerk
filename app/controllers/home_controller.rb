class HomeController < ApplicationController
  before_filter :authenticate_user, :only => [:index]

  def index
  end

  def welcome
    render 'home/welcome'
  end

  protected

  def authenticate_user
    redirect_to :welcome unless (current_student || current_teacher)
  end
end