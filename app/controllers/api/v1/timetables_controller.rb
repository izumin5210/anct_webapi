class Api::V1::TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show]
  respond_to :json

  def index
  end

  def show
  end

  private

  def set_timetable
    @timetable = Timetable.find(params[:id])
  rescue
    render json: {message: 'The timetable is not exist.'}, status: :not_found
  end
end
