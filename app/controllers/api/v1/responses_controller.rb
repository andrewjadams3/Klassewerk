class Api::V1::ResponsesController < ApplicationController
  respond_to :json

  def index
    render json: Response.all
  end

  def show
    render json: Response.find(params[:id])
  end

  def create
    puts params
    response = Response.new(worksheet_id: params[:response][:worksheet_id], student: current_student, answers: params[:response][:answers], submitted: params[:response][:submitted])
    if response.save
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 500
    end
  end

  private

  def response_params
    params.require(:response).permit(:worksheet_id, :answers, :submitted)
  end
end