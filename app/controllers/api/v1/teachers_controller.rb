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

  private

  def teacher
    Teacher.find(params[:id])
  end

end