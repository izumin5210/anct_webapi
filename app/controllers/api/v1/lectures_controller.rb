class Api::V1::LecturesController < ApplicationController
  before_action :set_lecture, only: [:show]
  respond_to :json

  def index
  end

  def show
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  rescue
    render json: {message: 'The lecture is not exist.'}, status: :not_found
  end
end
