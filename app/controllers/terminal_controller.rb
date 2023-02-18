class TerminalController < ApplicationController

  before_action :set_office

  def index

  end

  def office
    render("terminal/office", layout: "fullscreen")
  end

  def check
    login = params[:user][:login]
    password = params[:user][:password]
    user = User.where(username: login).first

    # Validate authentication
    if user.present? and user.valid_password?(password)
      # Check for another active shift
      active_shifts = Shift.where(worker: user.worker, end_time: nil)

      if active_shifts.any?
        # Active shifts still running, not creating new shift
        shifts_in_office = active_shifts.where(office: @office)
        shifts_out_office = active_shifts.where.not(office: @office)

        # Check out of all shifts for this office
        if shifts_in_office.any?
          shifts_in_office.each do |office_shift|
            office_shift.update!(end_time: DateTime.now)
          end
          flash[:success] = t("terminal.controller.success.check_out_html", office: @office.name).html_safe
        end

        # Inform about active shifts for other offices
        if shifts_out_office.any?
          flash[:info] = t("terminal.controller.info.check_still_html",
                           office: shifts_out_office.map{|x| x.office.name}.join(", ")).html_safe
        end

      else
        # Create new shift at the office
        Shift.create!(worker: user.worker, office: @office, start_time: DateTime.now)
        flash[:success] = t("terminal.controller.success.check_in_html", office: @office.name).html_safe
      end

    else
      # Not Valid!
      flash[:danger] = t("terminal.controller.error.invalid_credentials_html").html_safe
    end

    redirect_to terminal_office_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_office
    @office = Office.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def office_params
    params.require(:office).permit(id)
    params.require(:user).permit(:login, :password)
  end

end
