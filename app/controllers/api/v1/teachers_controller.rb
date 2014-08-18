class Api::V1::TeachersController < ApplicationController
  respond_to :json

  def index
    if(current_teacher)
      render json: Teacher.all
    else
      render json: ({error: "You must be logged in"}), status: 401
    end
  end

  def teacher
    if(current_teacher)
      render json: {id: current_teacher.id}
    else
      render json: {:error => "Invalid Login Details"}, status: 401
    end
  end

  def show
    if(current_teacher)
      render json: Teacher.find(params[:id])
    else
      render json: {:error => "Invalid Login Details"}, status: 401
    end
  end

end
