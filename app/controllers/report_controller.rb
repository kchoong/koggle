class ReportController < ApplicationController

  before_action :set_entity, :set_date, :set_path

  def report
    authorize! :read, Shift

    # Selected start time for range
    @selected_time = DateTime.new(@year, @month, @day)

    # determine start and end time based on range mode and selected time
    case @range_mode
    when :daily
      start_time = @selected_time.beginning_of_day
      end_time = @selected_time.end_of_day
    when :monthly
      start_time = @selected_time.beginning_of_month
      end_time = @selected_time.end_of_month
    else # :yearly
      start_time = @selected_time.beginning_of_year
      end_time = @selected_time.end_of_year
    end

    # retrieve and sort results
    @shifts = Shift.where("#{@entity.model_name.element}": @entity, start_time: start_time..end_time)
    @shifts = @shifts.order(start_time: :asc)

    # set date range
    @start_date_label = l(start_time.to_date, :format => :short)
    @end_date_label = l(end_time.to_date, :format => :short)

    # set graph data
    case @range_mode
    when :yearly
      @graph_shifts_data = @shifts.group_by_month { |u| u.start_time }.to_h { |k, v| [k, helpers.sum_duration(v)] }
    when :monthly
      @graph_shifts_data = @shifts.group_by_day { |u| u.start_time }.to_h { |k, v| [k, helpers.sum_duration(v)] }
    else # :daily
    end

    respond_to do |format|
      format.html
      format.json { render json: @shifts }
      format.xml { render xml: @shifts.as_json }
      format.xlsx {
        file_name = "#{@entity.id}_#{@entity.name}_#{start_time.to_date.to_s}_#{end_time.to_date.to_s}.xlsx"
        response.headers["Content-Disposition"] = "attachment; filename=\"#{file_name}\""
      }
    end
  end

  def redirect_report
    authorize! :read, Shift

    case params[:range][:mode].to_sym
    when :daily
      redirect_to action: "report", year: params[:range]["date(1i)"], month: params[:range]["date(2i)"], day: params[:range]["date(3i)"]
    when :monthly
      redirect_to action: "report", year: params[:range]["date(1i)"], month: params[:range]["date(2i)"]
    else # :yearly
      redirect_to action: "report", year: params[:range]["date(1i)"]
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_entity
    if params[:worker_id] then
      @entity = Worker.find(params[:worker_id])
      @entity_class = Worker.class
    elsif params[:office_id] then
      @entity = Office.find(params[:office_id])
      @entity_class = Office.class
    else
      raise t("report.error.no_entity")
    end
  end

  def set_date
    @year = params[:year] ? params[:year].to_i : Date.today.year
    @month = params[:month].to_i != 0 ? params[:month].to_i : 1
    @day = params[:day].to_i != 0 ? params[:day].to_i : 1

    if params[:month]
      @range_mode = params[:day] ? :daily : :monthly
    else
      @range_mode = :yearly
    end
  end

  def set_path
    @current_path = request.env['PATH_INFO']
  end
end
