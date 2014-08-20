class Api::V1::ResponsesController < ApplicationController
  respond_to :json

  def index
    if current_teacher
      render json: current_teacher.responses
    elsif current_student
      render json: current_student.responses
    else
      render json: ({error: "You must be logged in"}), status: 401
    end
  end

  def show
    if current_teacher
      render json: current_teacher.responses.find(params[:id])
    elsif current_student
      render json: current_student.responses.find(params[:id])
    else
      render json: ({error: "You must be logged in"}), status: 401
    end
  end

  def create
    response = Response.new(worksheet_id: params[:response][:worksheet_id], student: current_student, answers: params[:response][:answers], submitted: params[:response][:submitted])
    if response.save
      render json: response
    else
      render json: ({error: "You must be logged in"}), status: 401
    end
  end

  def update
    response = Response.find(params[:id])
    response.update_attributes(notes: params[:response][:notes])
    render json: response
  end

  private

  def response_params
    params.require(:response).permit(:worksheet_id, :answers, :notes, :submitted)
  end
end
