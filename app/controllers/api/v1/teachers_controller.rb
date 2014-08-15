class Api::V1::TeachersController < ApplicationController
  respond_to :json

  def index
    if(current_teacher)
      respond_with Teacher.all
    else
      respond_with ({error: "You must be logged in"}), status: 401
    end
  end

  def show
    if(current_teacher)
      respond_with teacher
    else
      respond_with ({error: "You must be logged in"}), status: 401
    end
  end

  private

  def teacher
    Teacher.find(params[:id])
  end

end