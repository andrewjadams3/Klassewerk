class Api::V1::StudentsController < ApplicationController
  respond_to :json

  def index
    respond_with Student.all
  end

  def show
    respond_with student
  end

  private

  def student
    Student.find(params[:id])
  end

end