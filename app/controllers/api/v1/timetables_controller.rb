require 'anct'

class Api::V1::TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show]
  respond_to :json

  def index
    @timetables = if params[:year].blank? && params[:term].blank?
         Timetable.now
       elsif params[:year].present? && params[:term].blank?
         Timetable.where(year: params[:year], term: Anct.term)
       elsif params[:year].blank? && params[:term].present?
         Timetable.where(year: Anct.fiscal_year, term: params[:term])
       else
         Timetable.where(year: params[:year], term: params[:term])
       end

    @timetables = @timetables.includes(:location)

    @timetables = @timetables.department(params[:department]) if params[:department].present?
    @timetables = @timetables.course(params[:course]) if params[:course].present?
    @timetables = @timetables.grade(params[:grade]) if params[:grade].present?
    @timetables = @timetables.where(wday: params[:wday]) if params[:wday].present?
    @timetables = @timetables.where(period: params[:period]) if params[:period].present?
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
