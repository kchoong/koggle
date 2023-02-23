class ReportController < ApplicationController

  before_action :set_date, :set_format

  def get_shifts
    # retrieve work shifts based on passed entity and date elements
    if @month > 0 and @day > 0 then
      @shifts = Shift.where("#{@entity.model_name.element}": @entity, start_time: DateTime.new(@year, @month, @day) .. DateTime.civil(@year, @month, @day, 23, 59))
    elsif @month > 0 then
      @shifts = Shift.where("#{@entity.model_name.element}": @entity, start_time: DateTime.new(@year, @month) .. DateTime.civil(@year, @month, -1, 23, 59))
    else
      @shifts = Shift.where("#{@entity.model_name.element}": @entity, start_time: DateTime.new(@year) .. DateTime.civil(@year, 12, -1, 23, 59))
    end

    # sort results
    @shifts = @shifts.order(start_time: :asc)
  end

  def worker
    # get specified worker
    @entity = Worker.find(params[:worker_id])
    get_shifts
  end

  def office
    # get specified office
    @entity = Office.find(params[:office_id])
    get_shifts
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_date
    @year = params[:year] ? params[:year].to_i : Date.today.year
    @month = params[:month].to_i
    @day = params[:day].to_i
  end

  def set_format

  end
end
