class TerminalController < ApplicationController

  before_action :set_office

  def office
    @worker = Worker.new
    render("terminal/office", layout: "fullscreen")
  end

  def check
    worker = Worker.find_by pin: params[:worker][:pin]

    # Validate authentication
    if worker.present?
      # Check for another active shift
      active_shifts = Shift.where(worker: worker, end_time: nil)

      if active_shifts.any?
        # Active shifts still running, not creating new shift
        shifts_in_office = active_shifts.where(office: @office)
        shifts_out_office = active_shifts.where.not(office: @office)

        # Check out of all shifts for this office
        if shifts_in_office.any?
          shifts_in_office.each do |office_shift|
            office_shift.update!(end_time: DateTime.now)
          end
          flash[:success] = t("terminal.controller.success.check_out", office: @office.name)
        end

        # Inform about active shifts for other offices
        if shifts_out_office.any?
          flash[:info] = t("terminal.controller.info.check_still",
                           office: shifts_out_office.map{|x| x.office.name}.join(", "))
        end

      else
        # Create new shift at the office
        Shift.create!(worker: worker, office: @office, start_time: DateTime.now)
        flash[:success] = t("terminal.controller.success.check_in", office: @office.name)
      end

    else
      # Not Valid!
      flash[:danger] = t("terminal.controller.error.invalid_credentials")
    end

    redirect_to terminal_office_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_office
    @office = Office.find(params[:id])
  end

end
