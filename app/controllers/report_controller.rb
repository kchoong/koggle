class ReportController < ApplicationController

  before_action :set_date, :set_path

  def worker
    # get specified worker
    @entity = Worker.find(params[:worker_id])
    render_report
  end

  def office
    # get specified office
    @entity = Office.find(params[:office_id])
    render_report
  end

  def render_report
    # determine start and end time based on passed entity and date elements
    if @month > 0 and @day > 0 then
      start_time = DateTime.new(@year, @month, @day)
      end_time = DateTime.civil(@year, @month, @day, 23, 59)
    elsif @month > 0 then
      start_time = DateTime.new(@year, @month)
      end_time = DateTime.civil(@year, @month, -1, 23, 59)
    else
      start_time = DateTime.new(@year)
      end_time = DateTime.civil(@year, 12, -1, 23, 59)
    end

    # retrieve and sort results
    @shifts = Shift.where("#{@entity.model_name.element}": @entity, start_time: start_time .. end_time)
    @shifts = @shifts.order(start_time: :asc)

    respond_to do |format|
      format.html
      format.json { render json: @shifts }
      format.xml { render xml: @shifts.as_json}
      format.xlsx {
        file_name = "#{@entity.id}_#{@entity.name}_#{start_time.to_date.to_s}_#{end_time.to_date.to_s}.xlsx"
        response.headers["Content-Disposition"] = "attachment; filename=\"#{file_name}\""
      }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_date
    @year = params[:year] ? params[:year].to_i : Date.today.year
    @month = params[:month].to_i
    @day = params[:day].to_i
  end

  def set_path
    @current_path = request.env['PATH_INFO']
  end
end
