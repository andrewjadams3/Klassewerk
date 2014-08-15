class Api::V1::SchoolsController < ApplicationController
  respond_to :json

  def index
    respond_with School.all
  end

  def show
    respond_with school
  end

  private

  def school
    School.find(params[:id])
  end

end