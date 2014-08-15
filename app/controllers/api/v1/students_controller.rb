class Api::V1::StudentsController < ApplicationController
  respond_to :json

  def index
    respond_with Student.all
  end

  def show
    respond_with student
  end

  def create
    respond_with :api, :v1, Student.create(lead_params)
  end

  private

  def lead
    Student.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :username, :security_question, :security_answer, :password, :password_confirmation)
  end

end